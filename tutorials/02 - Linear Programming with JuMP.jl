### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 8eb5fca7-2632-493f-9c0a-c44e55fd2096
begin
	import Pkg
	Pkg.add("PlutoUI")
	using PlutoUI
	PlutoUI.TableOfContents(title="Contents", indent=true, depth=4)
end

# ╔═╡ 1764d673-5353-41e4-a780-5e037787a391
# import Pkg  # import the Julia package manager, but we actually did this in the background
Pkg.add("JuMP") # install the JuMP package


# ╔═╡ 0d21918d-5bb0-49b4-8b34-6decbcf4db26
Pkg.add("Clp") # install the Clp.jl interface

# ╔═╡ 9ac7f3aa-b9ba-4208-ba21-d6cd2219e097
# load Plots library for visualization
begin
	Pkg.add("Plots")
	using Plots
end

# ╔═╡ 2331cd27-a102-44c2-af55-686565bf5014
# load JuMP and Clp.jl
using JuMP, Clp

# ╔═╡ c3ea1a42-eafe-11eb-1cdd-4199d0ecf87e
md"""
# Notebook 2: Linear Programming and JuMP

This notebook will demonstrate how to use the JuMP package in Julia to solve linear optimization problems. It draws heavily from [this notebook](https://github.com/east-winds/power-systems-optimization/blob/master/Notebooks/02-Anatomy-of-a-Model.ipynb) by Jesse D. Jenkins and Michael R. Davidson.
"""

# ╔═╡ 2d3f1366-4511-4ad3-ba1b-4d5c3cf460e6
md"""
[JuMP](https://jump.dev/) ("**Ju**lia for **M**athematical **P**rogramming") is an open-source Julia package that adds functionality for formulating and solving a variety of optimization problems. One advantage of JuMP is that its syntax matches the typical mathematical formalism used to specify optimization problems.

While JuMP provides the interface for formulating problems and accessing solutions, optimization problems are solved using a variety of [solvers](https://jump.dev/JuMP.jl/stable/installation/#Supported-solvers), some of which are open-source, others which are commercial. Each solver can solve different types of problems. Over the course of this class we will use different solvers as necessary. The [table](https://jump.dev/JuMP.jl/stable/installation/#Supported-solvers) of supported solvers indicates what types of problems each solver can support, and which are open source. The links provide access to documentation about the nuances of each solver.
"""

# ╔═╡ a8436f78-fea8-4cac-a285-9d287e514201
md"""
!!! tip "JuMP Documentation"
    Make sure that you take a look at the [`JuMP` documentation](https://jump.dev/JuMP.jl/stable/) whenever you have a question or want to find out how to do something that we don't discuss in any of our notebooks (or how to do it better!).
"""

# ╔═╡ bd7129da-099e-4352-8e8e-694f609c1f54
md"""
## Installing JuMP

Here we will outline the basic steps for installing JuMP, though you can also refer to the official [Installation Guide](https://jump.dev/JuMP.jl/stable/installation/#Installation-Guide). These steps may take a bit of time the first time you run them.

First, `import` the `Pkg` package manager, then install `JuMP`.
"""

# ╔═╡ 4136e3f3-4030-4aaf-984d-c472e9a2ff52
md"""
Next, we need to install a solver. We will use the Clp ([COIN-OR Linear Programming](https://github.com/coin-or/Clp)) solver via the [`Clp`](https://github.com/jump-dev/Clp.jl) package. As seen on the solver table, Clp is open source (via the EPL, or [Eclipse Public License](https://opensource.org/licenses/EPL-1.0)) and can solve linear programs (LP).
"""

# ╔═╡ f6a61fcc-9e0b-418d-be53-ca6d56db71f8
md"""
## How Many Widgets Should A Factory Produce?

In this example, we will formulate a constrained linear optimization problem and use `JuMP` and `Clp` to solve it. 

### The Problem

Suppose we own a factory that can produce two types of widgets:
* Widget A generates a profit of $$p_A = \$100$$ per widget; and
* Widget B generates a profit of $$p_B = \$75$$ per widget.
Let $$x$$ be the number of units of widget A that we want to produce, and $$y$$ the number of units of widget B. Our goal is to *maximize* our total profit $$p_Ax + p_By$$. This is the **objective function**. We express this objective using the equation
```math
\max 100x + 75y.\tag{1}
```

Further, we cannot build a negative number of either type of widget. This is known as a *non-negativity constraint*, and can be expressed as
```math
\begin{align*}
x &\geq 0 \tag{2}\\
y &\geq 0 \tag{3}
\end{align*}
```

This isn't a very interesting problem yet! We would simply build as much of both widgets as we could, because there are no constraints on our ability to produce. To make this more realistic, let's suppose that both widgets are produced using the same raw material $$M$$, of which we can only procure 300 units. Then, if:
* Widget A requires 40 units of $$M$$ per widget, and
* Widget B requires 20 units of $$M$$ per widget,
we arrive at the following material **constraint**:
```math
40x + 20y \leq 300.\tag{4}
```

But we might have another constraint: time! Each widget may take a different amount of labor to produce. For example, let's say that
* Widget A takes 6 hours to produce and
* Widget B takes 12 hours to produce.
Further, there are only 80 hours per work that can be allocated to widget production. This becomes the time constraint
```math
6x + 12y \leq 80.\tag{5}
```

Consolidating equations (1)--(5) gives us the following **constrained optimization problem**:
```math
\begin{alignat*}{2}
& &\max 100x + 75y\\
&\text{s.t.} & \\
& & x \geq 0\\
& & y \geq 0 \\
& & 40x + 20y \leq 300\\
& & 6x + 12y \leq 80
\end{alignat*}
```
"""

# ╔═╡ 59f2c440-0af8-4db2-a3f5-da7dd3807c4f
md"""
### Visualizing the Problem

Let's do some plotting to examine the geometry of our optimization problem. We can do this using the `Plots` package in Julia. If you want to know how to make plots in Julia, look at the [`Plots` documentation](https://docs.juliaplots.org/latest/).
"""

# ╔═╡ b1307793-e4db-4c8f-8d16-c06cbba4602c
md"""
We need to plot our constraints as well as the response function.
"""

# ╔═╡ ae3e8715-36ce-4844-9ff2-c6665c9ab0a5
# let's plot the problem
begin
	# set up objective function parameters and variables
	pa = 100
	pb = 75
	a = range(0, 8, step=0.5)
	b = range(0, 8, step=0.5)
	
	# define objective function
	f(a, b) = pa * a + pb * b
	
	# start plotting
	contour(a,b,(a,b)->f(a,b),nlevels=15, c=:heat, linewidth=10, colorbar = false, contour_labels = true) # objective function contours
	title!("Factory Optimization Problem") # add title
	xaxis!("x=Widget A", lims=(0, maximum(a))) # add x-axis title and limits
	yaxis!("y=Widget B", lims=(0, maximum(b))) # add y-axis title and limits
	xticks!(0:maximum(a)) # set x-axis ticks
	yticks!(0:maximum(b)) # set y-axis ticks
	areaplot!(a[a.<=11], (300 .- 40*a)./20, legend=false, opacity=0.3) # plot materials constraint feasible region
	areaplot!(a[a.<=8], (80 .- 6*a)./12, legend=false, opacity=0.3) # plot time constraint feasible region
end

# ╔═╡ db46732a-776d-44d0-8241-6b708e1fd5fe
md"""
We can see exactly where the solution will be, at the intersection of the feasible regions imposed by the two constraints (note how this is related to the gradient of the objective function)!  Let's now use JuMP to identify the location of this point (though we could also solve for it using linear algebra).
"""

# ╔═╡ 2fdc53f1-8bda-4917-ab87-8c7479aba60e
md"""
### Solving This Problem Using JuMP
"""

# ╔═╡ 296e5786-3ece-4314-8652-566bc9d2db7b
md"""
#### 1. Setting Up the Model and Solver

First, we should load `JuMP` and `Clp`.
"""

# ╔═╡ 5fa89194-2fa1-4fd7-928a-0ffbc2116e44
md"""
To solve our problem, first we need to **define the model**. The *model object* has lots of attributes, including the variables, constraints, solver options, etc. We create a new model using the `Model()` function. Since we are using the `Clp` solver, we need to tell JuMP to use the `Clp.Optimizer` solver function.
"""

# ╔═╡ 92fa4f4c-d109-4d60-ae5a-ae9ac429f412
factory_model = Model(Clp.Optimizer) # initialize the model object with the 

# ╔═╡ f468455b-b721-4d78-8435-23c844cdec13
md"""
There are a bunch of attributes and options that we could set, but we won't in this example. If needed, look at the `Clp.jl` [documentation](https://github.com/jump-dev/Clp.jl).
"""

# ╔═╡ c642b4dd-c892-42d2-bebf-ce9d22c60d13
md"""
#### 2. Define Variables
Decision variables ($$x$$ and $$y$$ in this case) in JuMP are defined using the `@variable` macro. The first argument passed to `@variable()` is the model object, in this case, `factory_model`, and the second argument are bounds on that variable, created using `>=` and `<=`. JuMP will interpret the bound specification to obtain the variable name. In this case, our only bounds directly on the variables are the non-negativity constraints.
"""

# ╔═╡ 76dd546d-3b83-4f88-b4e8-a7999c13c6c4
@variable(factory_model, x >= 0) # define x with the non-negativity and capacity constraints

# ╔═╡ 7e21e7b7-2254-4808-b630-14e4c4aabe3e
@variable(factory_model, y >= 0) # similarly define y

# ╔═╡ f677ceaf-c2b8-44ad-b610-33684cb97927
md"""
If we had a free (or unbounded) variable $$z$$, we could declare that variable using `@variable(model, z)`.

JuMP also requires unique names for each variable, or it will throw an error. This is one place where it's nice that Julia lets us use sub- and superscripts in variable names!
"""

# ╔═╡ 2f3ccf24-f279-43b7-a2d2-4cf54b233e35
@variable(factory_model, 10 >= x >= 0) # let's try defining x again with different bounds

# ╔═╡ 6a6e50b3-219c-419d-b39d-0dada5d6bd4e
md"""
If we did want to modify the bounds after defining the variable, we could do so using the `set_lower_bound` and `set_upper_bound` functions, or we could remove them using `delete_lower_bound` and `delete_upper_bound`.
"""

# ╔═╡ c7488e87-76b9-4f5c-86d2-6a65876cc6df
md"""
Finally, if we want to see all of the variables associated with a model, we can use the `all_variables` function to obtain an array.
"""

# ╔═╡ ff87c393-227d-452e-ac45-946b909d700d
all_variables(factory_model)

# ╔═╡ b3153de7-ea52-4eac-8711-8fb9c2240370
md"""
#### 3. Define Constraints

When defining variables, we were able to declare constraints on their values by specifying upper and lower bounds. However, we also have other constraints, which involve multiple decision variables. These are specified using the `@constraint` macro. Unlike variables, we also need to pass names for each constraint. We will use `time` for the time constraint and `materials` for the materials constraint.
"""

# ╔═╡ 5097c95c-0719-4799-b4a5-e2c501d27dae
@constraint(factory_model, time, 6x + 12y <= 80) # specify the time constraint

# ╔═╡ 581a916d-cd03-42ff-8095-887f74cdf536
@constraint(factory_model, materials, 40x + 20y <= 300) # materials constraint

# ╔═╡ 063d88d8-f8a1-45b9-80fd-146f227c6f33
md"""
Now, let's call the `factory_model` object to see all of the constraints.
"""

# ╔═╡ 90d9f976-5501-483c-8258-6f7e6d4f0240
factory_model

# ╔═╡ 341a3f05-c907-4f55-a644-ec75924b691d
md"""
#### 4. Define Objective Function

So far, we've defined the feasible region of the decision-variable domain by setting the constraints. But we need to specify our objective function to know what we are trying to minimize or maximize over this region. We define the objective function using the `@objective` macro. In addition to specifying the model objective and the function, we need to tell JuMP whether we want to minimize or maximize.
"""

# ╔═╡ fa0317c3-d541-4ae2-b3cd-55c45c1caa1e
@objective(factory_model, Max, 100x + 75y)

# ╔═╡ 194bafe3-90a9-4b26-a44b-dab94716f4a2
md"""
Now we can see the full model definition.
"""

# ╔═╡ 58758fa4-1aa8-4542-90a1-af054f13afd3
factory_model

# ╔═╡ cdce7407-5893-4c50-8303-db85c4e039e6
md"""
!!! tip "Alternative Ways to Define Models"
    We won't go into detail here, but there are other ways to define the model, which are detailed in the [JuMP documentation](https://jump.dev/JuMP.jl/stable/). For example, we can specify multiple variables using [`@variables`](https://jump.dev/JuMP.jl/stable/manual/variables/#variables). Similarly, we can use [`@constraints`](https://jump.dev/JuMP.jl/stable/manual/constraints/#The-@constraints-macro) to define multiple constraints at once. Or we can use [loops](https://jump.dev/JuMP.jl/stable/tutorials/Getting%20started/variables_constraints_objective/#Constraints-in-a-loop) to define multiple constraints or constraints involving many variables. We can also specify the model in [vectorized syntax](https://jump.dev/JuMP.jl/stable/tutorials/Getting%20started/variables_constraints_objective/#Vectorized-syntax), which is similar to how linear programs are specified in MATLAB. 
"""

# ╔═╡ 63bf07d7-7b4d-46a6-ac8e-7de7a7ce3d51
md"""
#### 5. Solve the Model

Now it's time to solve the model and find the optimal values $$(x^*, y^*)$$. Since we specified the solver when we initialized `factory_model`, all we have to do is call the `optimize!()` function.
"""

# ╔═╡ 46f1cfcb-9da8-4a8f-9025-565d037730fa
md"""
!!! note
    Do you remember what the exclamation mark at the end of `optimize!` signifies?
"""

# ╔═╡ fc22da80-c143-41f9-b1e2-dc166d17819e
optimize!(factory_model)

# ╔═╡ b2f3bb30-392a-4bd4-9929-4aa65fc40251
md"""
Outside of the Pluto environment, this command would print information about the solution, including the optimal objective value, the number of iterations needed to find the solution, and the amount of time it took to solve the problem.
"""

# ╔═╡ aa0ae5ad-cdac-4bb1-a18b-31f24b6fed62
md"""
#### 6. Query the Solution

To find the optimal values of our decision variables, we need to query the values of the variables using `value.()`.
"""

# ╔═╡ e8e42dca-3702-4e4c-bab1-306d8ed7252f
value.(x)

# ╔═╡ 3b00e321-624c-4899-8a5c-abac541c9810
value.(y)

# ╔═╡ 11a5f4fb-3329-46b9-bd1b-5c76260149df
md"""
!!! note "value() vs. value.()"
    We used `value.()` (the vectorized version of `value()`) because JuMP stores decision variables differently depending on their number and how they were defined. Uses the dot-syntax here works with any model specification, while the plain `value()` will not work if a queried decision variable is stored as a vector.
"""

# ╔═╡ 69f4c03d-08d6-48fc-9ef6-36b3d032b6f2
md"""
So we can see that our optimal inputs are $$(x^*, y^*) = (5.56, 3.89)$$ (and we'll pretend that we can manufacture and sell parts of widgets). 
"""

# ╔═╡ 5d88fc49-cd08-4b1f-adde-ca53fec680a4
# let's replot the feasible region and contours
# notice that we do not need to redefine the objective function f(a,b)
begin
	# replot the previous plot
	contour(a,b,(a,b)->f(a,b),nlevels=15, c=:heat, linewidth=10, colorbar = false, contour_labels = true) # objective function contours
	title!("Factory Optimization Problem") # add title
	xaxis!("x=Widget A", lims=(0, maximum(a))) # add x-axis title and limits
	yaxis!("y=Widget B", lims=(0, maximum(b))) # add y-axis title and limits
	xticks!(0:maximum(a)) # set x-axis ticks
	yticks!(0:maximum(b)) # set y-axis ticks
	areaplot!(a, (300 .- 40*a)./20, legend=false, opacity=0.3) # plot materials constraint feasible region
	areaplot!(a, (80 .- 6*a)./12, legend=false, opacity=0.3) # plot time constraint feasible region
	
	# now we plot the solution that we obtained
	scatter!([value.(x)],[value.(y)], markercolor="blue", marker=:star8)
end

# ╔═╡ fb4f2a3b-75dd-4734-9128-96dc0df11751
md"""
The solution $$(x^*, y^*)$$ is exactly where we deduced it would be geometrically. 
"""

# ╔═╡ e9ce162d-1ba7-4f52-a1a9-133730366915
md"""
We can also use `value.()` to evaluate our constraints without manually using the equations.
"""

# ╔═╡ 62f32785-cb19-473a-8396-d8c815f909ec
value.(time)

# ╔═╡ e9025ff6-c3ab-44ec-b6e4-009469f27bbf
value.(materials)

# ╔═╡ 630b810f-ace8-457c-bc15-20ba7a8dc22a
md"""
What if we also want the optimal objective value? We can obtain this using `objective_value()`.
"""

# ╔═╡ e7657d7a-15b7-4d80-b305-950735f0bee1
objective_value(factory_model)

# ╔═╡ 77244b3b-32ca-4bf3-860a-07cdfb3d14b2
md"""
We could also define other expressions via the [`@expression` macro](https://jump.dev/JuMP.jl/stable/expressions/#JuMP.@expression) as functions of the decision variables and evaluate those. For example, let's say that we wanted to know the total number of widgets we'd produce under our optimal allocation of resources.
"""

# ╔═╡ f803139c-f2ce-44b0-b732-268727b866d9
@expression(factory_model, total_widgets, x+y)

# ╔═╡ f34221de-439e-44a1-9780-72a4724627b8
value.(total_widgets)

# ╔═╡ 79c7a17c-edb4-494d-8358-30142f68ba1e
md"""
#### 7. Dual Solutions

We can identify if our model has a dual solution by calling `has_duals()`.
"""

# ╔═╡ 623a19e0-cf60-4da6-81f8-ba634d2c1782
has_duals(factory_model)

# ╔═╡ fa077ff0-a230-4593-aa88-4550235a720e
md"""
If we want to know the dual solution associated with a constraint, we use the `shadow_price()` function.
"""

# ╔═╡ f89e997d-0962-43f4-bbec-6b55269072f6
shadow_price(time)

# ╔═╡ 6c859c0f-8797-44df-88c3-730d74806612
shadow_price(materials)

# ╔═╡ 7b974d67-1d61-4b44-935c-b3c79698d59b
md"""
If the binding constraint was a variable bound, we could also query that shadow price by calling `reduced_cost()` on the variable.
"""

# ╔═╡ 472471a5-c39c-410a-92cf-6efc0cc152e5
reduced_cost(x)

# ╔═╡ d5d38a0d-afd5-404f-b97d-22adc37b94d8
reduced_cost(y)

# ╔═╡ 3d7fa7fd-7a51-4822-8220-bbd0fcfdb5b7
md"""
In this case, the relevant shadow prices are zero because the optimum is in the interior of the domain. If we had added a strong enough upper bound on the value(s) of one or both of our decision variables (say, x <= 4), then this would be non-zero.
"""

# ╔═╡ Cell order:
# ╟─c3ea1a42-eafe-11eb-1cdd-4199d0ecf87e
# ╟─8eb5fca7-2632-493f-9c0a-c44e55fd2096
# ╟─2d3f1366-4511-4ad3-ba1b-4d5c3cf460e6
# ╟─a8436f78-fea8-4cac-a285-9d287e514201
# ╠═bd7129da-099e-4352-8e8e-694f609c1f54
# ╠═1764d673-5353-41e4-a780-5e037787a391
# ╟─4136e3f3-4030-4aaf-984d-c472e9a2ff52
# ╠═0d21918d-5bb0-49b4-8b34-6decbcf4db26
# ╠═f6a61fcc-9e0b-418d-be53-ca6d56db71f8
# ╟─59f2c440-0af8-4db2-a3f5-da7dd3807c4f
# ╠═9ac7f3aa-b9ba-4208-ba21-d6cd2219e097
# ╟─b1307793-e4db-4c8f-8d16-c06cbba4602c
# ╠═ae3e8715-36ce-4844-9ff2-c6665c9ab0a5
# ╟─db46732a-776d-44d0-8241-6b708e1fd5fe
# ╟─2fdc53f1-8bda-4917-ab87-8c7479aba60e
# ╟─296e5786-3ece-4314-8652-566bc9d2db7b
# ╠═2331cd27-a102-44c2-af55-686565bf5014
# ╟─5fa89194-2fa1-4fd7-928a-0ffbc2116e44
# ╠═92fa4f4c-d109-4d60-ae5a-ae9ac429f412
# ╟─f468455b-b721-4d78-8435-23c844cdec13
# ╟─c642b4dd-c892-42d2-bebf-ce9d22c60d13
# ╠═76dd546d-3b83-4f88-b4e8-a7999c13c6c4
# ╠═7e21e7b7-2254-4808-b630-14e4c4aabe3e
# ╟─f677ceaf-c2b8-44ad-b610-33684cb97927
# ╠═2f3ccf24-f279-43b7-a2d2-4cf54b233e35
# ╟─6a6e50b3-219c-419d-b39d-0dada5d6bd4e
# ╟─c7488e87-76b9-4f5c-86d2-6a65876cc6df
# ╠═ff87c393-227d-452e-ac45-946b909d700d
# ╟─b3153de7-ea52-4eac-8711-8fb9c2240370
# ╠═5097c95c-0719-4799-b4a5-e2c501d27dae
# ╠═581a916d-cd03-42ff-8095-887f74cdf536
# ╟─063d88d8-f8a1-45b9-80fd-146f227c6f33
# ╠═90d9f976-5501-483c-8258-6f7e6d4f0240
# ╟─341a3f05-c907-4f55-a644-ec75924b691d
# ╠═fa0317c3-d541-4ae2-b3cd-55c45c1caa1e
# ╟─194bafe3-90a9-4b26-a44b-dab94716f4a2
# ╠═58758fa4-1aa8-4542-90a1-af054f13afd3
# ╟─cdce7407-5893-4c50-8303-db85c4e039e6
# ╟─63bf07d7-7b4d-46a6-ac8e-7de7a7ce3d51
# ╟─46f1cfcb-9da8-4a8f-9025-565d037730fa
# ╠═fc22da80-c143-41f9-b1e2-dc166d17819e
# ╟─b2f3bb30-392a-4bd4-9929-4aa65fc40251
# ╟─aa0ae5ad-cdac-4bb1-a18b-31f24b6fed62
# ╠═e8e42dca-3702-4e4c-bab1-306d8ed7252f
# ╠═3b00e321-624c-4899-8a5c-abac541c9810
# ╟─11a5f4fb-3329-46b9-bd1b-5c76260149df
# ╟─69f4c03d-08d6-48fc-9ef6-36b3d032b6f2
# ╠═5d88fc49-cd08-4b1f-adde-ca53fec680a4
# ╟─fb4f2a3b-75dd-4734-9128-96dc0df11751
# ╟─e9ce162d-1ba7-4f52-a1a9-133730366915
# ╠═62f32785-cb19-473a-8396-d8c815f909ec
# ╠═e9025ff6-c3ab-44ec-b6e4-009469f27bbf
# ╟─630b810f-ace8-457c-bc15-20ba7a8dc22a
# ╠═e7657d7a-15b7-4d80-b305-950735f0bee1
# ╟─77244b3b-32ca-4bf3-860a-07cdfb3d14b2
# ╠═f803139c-f2ce-44b0-b732-268727b866d9
# ╠═f34221de-439e-44a1-9780-72a4724627b8
# ╟─79c7a17c-edb4-494d-8358-30142f68ba1e
# ╠═623a19e0-cf60-4da6-81f8-ba634d2c1782
# ╟─fa077ff0-a230-4593-aa88-4550235a720e
# ╠═f89e997d-0962-43f4-bbec-6b55269072f6
# ╠═6c859c0f-8797-44df-88c3-730d74806612
# ╟─7b974d67-1d61-4b44-935c-b3c79698d59b
# ╠═472471a5-c39c-410a-92cf-6efc0cc152e5
# ╠═d5d38a0d-afd5-404f-b97d-22adc37b94d8
# ╟─3d7fa7fd-7a51-4822-8220-bbd0fcfdb5b7
