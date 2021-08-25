### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 7271a414-ee23-11eb-15f6-3f4ed903032b
begin
	import Pkg
	Pkg.add(["GraphRecipes", "Cbc"])
	using PlutoUI
	TableOfContents(title="Contents", indent=true, depth=4)
end

# ╔═╡ 91d54654-aab2-4449-af4d-5a58a589f160
using JuMP, Cbc

# ╔═╡ 6b06014c-9160-4bc8-997f-51332659a54b
begin
	using GraphRecipes, Plots # load the packages for plotting network graphs. This might take a few minutes if you haven't run this cell before!
	
	# set up the network adjacency matrix
	# ordered as City 1, City 2, Facility 1, Facility 2, Facility 3
	waste_adj = [0 0 1 1 1;
				 0 0 1 1 1;
				 0 0 0 0 1;
		 		 0 0 1 0 1;
			     0 0 0 0 0]
	# define edge labels for edges present in the adjacency matrix
	edgelab_dict = Dict(
		(1, 3) => "15 km",
		(1, 4) => "5 km",
		(1, 5) => "30 km",
		(2, 3) => "10 km",
		(2, 4) => "15 km",
		(2, 5) => "25 km",
		(3, 5) => "18 km",
		(4, 3) => "15 km",
		(4, 5) => "32 km"
	)
	
	# set up x-y coords of nodes
	xpos = [1.5 1 0.25 2 -2]
	ypos = [1.5 -1.5 -0.5 0.5 0]
	
	graphplot(waste_adj, x=xpos, y=ypos, markersize=0.2,
		nodeshape=[:circle, :circle, :rect, :rect, :rect],
		markercolor=:lightgrey,
		names=["City 1", "City 2", "WTE 1", "MRF 2", "LF 3"],
		linestyle=:solid,
		edgelabel=edgelab_dict,
		edgelabel_offset = -0.18
	)
end
	

# ╔═╡ 23cdf259-ba85-4010-9f3a-9189a8c818a3
md"""
# Mixed-Integer Linear Programming

In this notebook, we will use the waste allocation example from class to see how to implement a mixed-integer linear program (MILP) in JuMP. One difference between this notebook and the Linear Programming notebook is that the Clp solver that we used for LP does not solve MILP problems. Instead, we will use the Cbc solver with the `Cbc.jl` package.
"""

# ╔═╡ b746518b-6b83-420d-9e22-2e3fae9efe22
md"""
In particular, we will solve a simple waste allocation problem. This is a type of supply chain problem aimed at allocating waste from producers to consumers (waste managemeent sites).
"""

# ╔═╡ 919f44cd-3aae-433b-9f4f-0c3231f2b9a9
md"""

## Network Layout

In this example, waste is produced by two cities.
* City 1 produces 100 Mg/day of waste.
* City 2 produces 170 Mg/day of waste.

There are three sites which can manage and dispose of waste. 
* Facility 1: A Waste-to-Energy (WTE) facility, which incinerates waste to produce thermal energy but leaves 20% of the original mass as residual ash. This facility has a capacity of 150 Mg/day.
* Facility 2: A Materials Recovery Facility (MRF), which recycles waste. However, only 40% of the waste sent to the MRF is recycleable, and the rest must be disposed of at another facility. This facility has a capacity of 130 Mg/day.
* Facility 3: A Landfill (LF), where waste is disposed. This facility has a capacity of 200 Mg/day.

The resulting network (including distances) can be seen below. Notice the connections between some of the waste facilities and others as residual waste can be processed downstream.
"""

# ╔═╡ ec91b6cf-f03f-49e0-b0e5-dea5758e6662
md"""
## Problem Formulation
"""

# ╔═╡ 0c614e03-3be4-48fc-a517-155c978cddf5
md"""
### Decision Variables

Our goal is to decide how to dispose of the waste produced by the two cities. We also want to know where to send the residual waste from the MRF facility, as this can go to either the WTE or the LF. These decision variables are:
* ``W_{ij}``: amount of waste (Mg/day) sent from city ``i`` to disposal facility ``j``.
* ``R_{kj}``: amount of residual waste (Mg/day) sent from disposal facility ``k`` to disposal facility ``j``.
``W_{ij}`` and ``R_{kj}`` are continuous variables. However, if we do not want to operate a facility (for example, if sending waste to be recycled would increase the cost of the system), we can save its fixed costs (see the next section on costs). This means that we have additional *binary* constraints:
* ``Y_i``: off/on state of disposal facility ``i``. 
"""

# ╔═╡ cbcdb14f-e2c1-4bd5-b4b5-960bcda29670
md"""
### Objective Function: Cost Minimization

We would like to minimize the total cost of managing our produced waste. We need to define the individual cost components. First, we have to transport waste from one producer (a city or a waste disposal cite that produces residual waste) to a consumer (a waste disposal site). Transporting waste from one location to another costs \$1.50/Mg-km. This results in a transportation cost of
```math
\begin{align*}
1.5[15W_{11} &+ 5W_{12} + 30W_{13} + 10W_{21} + 15W_{22}\\ 
&+ 25W_{23} + 18R_{13} + 15R_{21} + 32R_{23}]. \tag{O1}
\end{align*}
```


Each facility also several associated costs to run the facility and dispose of waste.

| **Facility** | **Fixed Costs (\$/yr)** | **Tipping Costs(\$/Mg)** | **Recycling Costs (\$/Mg)** |
|:----------: | :----------: |:------------:|:------------:|
| WTE   | 900,000 | 60 |    |
| MRF   | 400,000 | 5  | 35 |
| LF    | 700,000 | 40 |    |

So the cost of sending waste to the WTE facility (disposal facility \#1) is
```math
2466Y_1 + 60(W_{11} + W_{21} + R_{21}),\tag{O2}
```
where the coefficient of ``Y_1`` is the daily fixed cost of operating the WTE facility.

The cost of sending waste to the MRF facility is
```math
1096Y_2 + 5(W_{12} + W_{22}) + (35)(0.4)(W_{12} + W_{22}),\tag{O3}
```
where the last term accounts for the fact that only 40% of the waste sent to the MRF facility is recycleable.

Lastly, the cost of sending waste to the LF facility is
```math
1918Y_3 + 40(W_{13} + W_{23} + R_{13} + R_{23}).\tag{O4}
```

Combining equations (O1)-(O4) and consolidating coefficients gives us the objective function
```math
\begin{align*}
82.5W_{11} &+ 26.5W_{12} + 85W_{13} + 75W_{21} + 41.5W_{22} + 77.5W_{23}\\ &+ 67R_{13} + 82.5R_{21} + 88R_{23} + 2466Y_1 + 1096Y_2 + 1918Y_3\tag{Obj}
\end{align*}
```
"""

# ╔═╡ b59091ab-488f-41a1-bb65-dfd0ce813f0c
md"""
### Mass Balance Constraints

We have the following constraints resulting from the amount of waste that is produced by each city:
```math
\begin{align*}
\text{City 1:} && W_{11} + W_{12} + W_{13} &= 100\tag{C1};\\
\text{City 2:} && W_{21} + W_{22} + W_{33} &= 170\tag{C2}.
\end{align*}
```
Similarly, we have the following constraints on the residual waste:
```math
\begin{align*}
\text{WTE Ash}: && R_{13} &= 0.2(W_{11} + W_{21} + R_{21})\tag{C3}\\
\text{MRF Recycling}: && R_{21} + R_{23} &= 0.6(W_{12} + W_{22})\tag{C4}
\end{align*}
```
The capacity constraints for each facility give us some additional constraints:
```math
\begin{align*}
\text{WTE:} && W_{11} + W_{21} + R_{21} &\leq 150\tag{C5}\\
\text{MRF:} && W_{12} + W_{22} &\leq 130\tag{C6}\\
\text{LF:} && W_{13} + W_{23} + R_{13} + R_{23} &\leq 200\tag{C7}.
\end{align*}
```
"""

# ╔═╡ e38cdb91-6f3f-4a04-ac9f-4ec2102b2e92
md"""
### Constraints Involving ``Y_i``

The last set of constraints that we need to articulate are constraints involving the binary variables ``Y_i``. Remember that these variables reflect whether the corresponding disposal facility will be online. We do know that the LF facility must be operational, as all other disposal facilities have to send some fraction of their waste to it as residual waste. Therefore,
```math
Y_3 = 1\tag{C8}.
```
The other two are a little more tricky. If $Y_i = 0$, the total amount of waste going to that facility must also be zero, and that sum must be positive if ``Y_i = 1``. For example, for the WTE facility:
```math
W_{11} + W_{21} + R_{21} \begin{cases} = 0 &&\text{if } Y_1 = 0\\
									   > 0 &&\text{if } Y_1 = 1
\end{cases}\tag{C9}
```
and for the MRF facility:
```math
W_{12} + W_{22}  \begin{cases} = 0 &&\text{if } Y_2 = 0\\
									   > 0 &&\text{if } Y_2 = 1
\end{cases}\tag{C10}
```
"""

# ╔═╡ fe39e552-544e-4fa3-8035-7d80f546c553
md"""
## JuMP Implementation

This gives us the following variable specification (we'll use the `@variables` macro to define multiple variables at once in a readable way). Notice several aspects of variable declaration that we didn't use before.
* We've defined our variables as an *array* of variables, rather than defining each of them one at a time. This just simplifies declaration and querying, since we can use one line to define all of the ``W_{ij}`` variables, for example.
* We also define the `base_name` of our variables. This just means that they will be printed out with the correct variable names, including subscripts. This is completely optional.
* The ``Y_i`` variables are declared as binary variables using `Bin`. This establishes a constraint that these variables can only take values of `0` or `1`.

We also have used some new syntax for defining constraints (using the `@constraints` macro). We also have some additional options for how to specify constraints as a result of defining our variables as arrays. Since we defined `w`, `r`, and `y` as arrays, we can define certain constraints in terms of sums of slices (subarrays), instead of having to write out every term individually.

We need to define some additional constraints. Not all of the ``R_{ij}`` terms are valid; no residual waste gets sent from LF anywhere else, for example. However, those terms are created as a part of our variable specification, so we need to fix them to `0`. Whether the need to define these extra constraints is worth the ease of summing over slices and querying results will depend on the scale of the problem.

In class, we saw (or will see, depending on when you look at this notebook) the "Big-M" approach to these *indicator constraints*, which assigns a large coefficient to the binary variable and makes that an upper bound on the constrained sum. This is a useful trick for certain solvers, which might not be as flexible in allowing more direct representations of indicator constraints. Indeed, we could have bound ``Y_i`` between 0 and 1 and used a set of Big-M constraints. However, in JuMP, we can specify these indicator constraints more directly, which allows us to define ``Y_i`` as binary variables.

To represent an indicator constraint that is active when a binary variable `a` is 1, we use a syntax like this: `a => {w + r == 0}`. If the constraint should be active when `a` is zero, negate the value of `a` in the constraint: `!a => {w + r == 0}`. In our case (for constraints (C9) and (C10)), the only cases we need to represent are when `y[1]` and `y[2]` are 0, as the lower bounds on the `w` and `r` variables take care of the other case for us.
"""

# ╔═╡ d8c831ea-46c0-4032-8403-1029b062f10c
begin
	waste_model = Model(Cbc.Optimizer) # we will use the Cbc optimizer for this model
	@variables(waste_model, begin
		w[i=1:2, j=1:3] >= 0, (base_name = "W")
		r[i=1:3, j=1:3] >= 0, (base_name = "R")
		y[i=1:3], Bin, (base_name = "Y")
	end)
	# we could also specify the objective by compiling the coefficients into vectors and multiplying
	@objective(waste_model, Min, 82.5w[1,1] + 26.5w[1,2] + 85w[1,3] + 75w[2,1] + 41.5w[2,2] + 77.5w[2,3] + 67r[1,3] + 82.5r[2,1] + 88r[2,3] + 2466y[1] + 1096y[2] + 1918y[3])
	@constraints(waste_model, begin
		sum(w[1,:]) == 100 # C1: we can sum across the w[1,1:3] row instead of writing out the three terms)
		sum(w[2,:]) == 170 # C2: similar to above
		r[1,3] - 0.2(w[1,1] + w[2,1] + r[2,1]) == 0 # C3
		r[2,1] + r[2,3] - 0.6(w[1,2] + w[2,2]) == 0 # C4
		sum(w[:,1]) + r[2,1] <= 150 # C5
		sum(w[:,2]) <= 130 # C6
		sum(w[:,3]) + sum(r[:,3]) <= 200 # C7
		y[3] == 1 # C8
		# indicator constraints
		!y[1] => {sum(w[:,1]) + r[2,1] == 0} # C9
		!y[2] => {sum(w[:,2]) == 0} # C10
		# now we need to constrain our extra r variables.
		sum(r[i,i] for i=1:3) == 0 # no residuals go from a facility to itself
		sum(r[3,:]) == 0 # no residuals go from LF to the others
		r[1,2] == 0 # no residuals go from WTE to MRF
	end)
end

# ╔═╡ a5481653-fc32-45bc-b6f0-e35eaa01dee1
waste_model # see the full specification

# ╔═╡ 597e2862-4833-40f4-939d-a625254ec523
md"""
## Optimize and Query The Solution
"""

# ╔═╡ ea11e99e-334e-4c0f-8a47-08e4422e714b
optimize!(waste_model)

# ╔═╡ 1b764c50-cb14-4126-9312-018f699a3c82
value.(w)

# ╔═╡ b4820e31-a8bb-4cd4-8bb6-0b0b696b80b8
value.(r)

# ╔═╡ 5c697a45-5cb4-4028-bafd-cd4869a37bef
value.(y)

# ╔═╡ 0d6911a4-6ab0-44f8-bfcb-a8cbf322737e
md"""
That's the same solution we saw in class! We can visualize the optimal management strategy below.
"""

# ╔═╡ 18ea3fa1-b612-486e-aede-b8e492d561dc
begin
	# set up the network adjacency matrix
	# ordered as City 1, City 2, Facility 1, Facility 2, Facility 3
	sol_adj = [0 0 0 1 0;
				 0 0 0 0 1;
				 0 0 0 0 1;
		 		 0 0 1 0 1;
			     0 0 0 0 0]
	# define edge labels for edges present in the adjacency matrix
	sol_edgelab_dict = Dict(
		(1, 4) => "100 Mg",
		(2, 5) => "170 Mg",
		(3, 5) => "7.5 Mg",
		(4, 3) => "37.5 Mg",
		(4, 5) => "22.5 Mg"
	)
		
	graphplot(sol_adj, x=xpos, y=ypos, markersize=0.2,
		nodeshape=[:circle, :circle, :rect, :rect, :rect],
		markercolor=:lightgrey,
		names=["City 1", "City 2", "WTE 1", "MRF 2", "LF 3"],
		linestyle=:solid,
		edgelabel=sol_edgelab_dict,
		edgelabel_offset = -0.18
	)
end

# ╔═╡ 79d7a972-b499-4d17-86c0-b742162a2293
md"""
City 1 sends all 100 Mg of its waste each day to the MRF, while City 2 sends all 170 Mg of its waste directly to the LF. Then the MRF sends 37.5 Mg of its non-recyclable material to the WTE to be incinerated and the remaining 22.5 Mg to the LF. Finally, 7.5 Mg of residual ash gets sent from the WTE to the LF.
"""

# ╔═╡ fb635802-2f59-409b-bd32-fcbe78c7c074
objective_value(waste_model)

# ╔═╡ d8457b9b-60d4-403c-9bc7-cb5a12229813
md"""
 The total cost to manage the system is \$26881.
"""

# ╔═╡ Cell order:
# ╟─7271a414-ee23-11eb-15f6-3f4ed903032b
# ╟─23cdf259-ba85-4010-9f3a-9189a8c818a3
# ╠═91d54654-aab2-4449-af4d-5a58a589f160
# ╟─b746518b-6b83-420d-9e22-2e3fae9efe22
# ╟─919f44cd-3aae-433b-9f4f-0c3231f2b9a9
# ╠═6b06014c-9160-4bc8-997f-51332659a54b
# ╟─ec91b6cf-f03f-49e0-b0e5-dea5758e6662
# ╟─0c614e03-3be4-48fc-a517-155c978cddf5
# ╟─cbcdb14f-e2c1-4bd5-b4b5-960bcda29670
# ╟─b59091ab-488f-41a1-bb65-dfd0ce813f0c
# ╟─e38cdb91-6f3f-4a04-ac9f-4ec2102b2e92
# ╟─fe39e552-544e-4fa3-8035-7d80f546c553
# ╠═d8c831ea-46c0-4032-8403-1029b062f10c
# ╠═a5481653-fc32-45bc-b6f0-e35eaa01dee1
# ╟─597e2862-4833-40f4-939d-a625254ec523
# ╠═ea11e99e-334e-4c0f-8a47-08e4422e714b
# ╠═1b764c50-cb14-4126-9312-018f699a3c82
# ╠═b4820e31-a8bb-4cd4-8bb6-0b0b696b80b8
# ╠═5c697a45-5cb4-4028-bafd-cd4869a37bef
# ╟─0d6911a4-6ab0-44f8-bfcb-a8cbf322737e
# ╟─18ea3fa1-b612-486e-aede-b8e492d561dc
# ╟─79d7a972-b499-4d17-86c0-b742162a2293
# ╠═fb635802-2f59-409b-bd32-fcbe78c7c074
# ╟─d8457b9b-60d4-403c-9bc7-cb5a12229813
