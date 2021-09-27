### A Pluto.jl notebook ###
# v0.16.0

using Markdown
using InteractiveUtils

# ╔═╡ 2f2edce8-1872-11ec-32b3-671bc66f8d3b
begin
	import Pkg  # import the Julia package manager
	Pkg.add("JuMP") # install the JuMP package
	Pkg.add("Clp") # install the Clp.jl interface
end

# ╔═╡ c21b40dd-f918-4e21-a5b2-e52e5cbb10a0
using JuMP, Ipopt

# ╔═╡ 7640589c-56d7-497e-9aa4-74241dd6c560
md"""
# Define the model
```math
 \begin{align}
    & \min Z = 77.5 E^{1.55} +35 x_2 + 45 x_3 \\
   &\text{subject to} &&\\
    & -  40 E + 2.0 x_1 +1.0 x_2 + 0.70 x_3 & \leq & 470\\
    & x_1 + x_2 + x_3 &=& 3 500 \\
    & E &\leq& 100 \\
    & E, x_1, x_2, x_3 &\geq& 0 
 \end{align}
```
"""

# ╔═╡ 51804401-2ff7-4f96-a25a-5f0e59cf4a53
md"""
# Set up the model in JuMP
"""

# ╔═╡ 6710634d-208b-4f55-9e47-b4e004514a66
md"""
## Define the model object

First, we need to give the model a name and specify that we are using `Ipopt.Optimizer` to use the Ipopt solver for non-linear and integer programming. This creates a "container" for the model specification and solution.
"""

# ╔═╡ 1cfcf9bb-cced-4ebd-a885-08c84162740f
eutro_model = Model(Ipopt.Optimizer) # initialize the model object with the Clp solver

# ╔═╡ db8c1aee-fc85-471e-ad33-d07c37d2a013
md"""
## Define variables
"""

# ╔═╡ f59a5250-5dc7-4c48-a03c-e19fc524dccb
md"""
Define the decision variables in this section. Include constraints on the variable domains, including non-negativity constraints.

If you make a mistake setting up the constraints, do not change the cell where those variables were defined and rerun it (JuMP will throw an error). Instead, create a new code cell by clicking on the + sign below a cell, then use the `set_lower_bound`, `set_upper_bound`, `delete_lower_bound`, and `delete_upper_bound` functions.
"""

# ╔═╡ fcfcb9c3-2e82-4ac6-bc54-916fa71066e0
begin 
	@variable(eutro_model, x[1:3], lower_bound=0)
	@variable(eutro_model, E, lower_bound=0, upper_bound=1);
end

# ╔═╡ 70223245-40fc-4755-9233-57d65cf0272a
md""" ### Define Objective: 
note that syntax is slightly different for non-linear functions 

There are three main changes to solve nonlinear programs in JuMP.

- Use @NLobjective instead of @objective if nonlinear 
- Use @NLconstraint instead of @constraint if nonlinear 
- Use @NLexpression instead of @expression if nonlinear 

"""

# ╔═╡ 0bb61701-62e8-410d-ae85-7ad5d44d69a7
@constraint(eutro_model,-40*E + 2.0*x[1]+x[2]+0.7*x[3] <= 470)

# ╔═╡ c5ba0f60-1ffc-4fc2-ae66-9147673ee330
@constraint(eutro_model,x[1]+x[2]+x[3]==3500)

# ╔═╡ b14f4e61-c3ce-40ae-97a6-113b39baeeeb
@constraint(eutro_model,E<=100)

# ╔═╡ 1bc66dd0-a5cc-45b3-aa07-1fd3782382b1
@NLobjective(eutro_model, Min, 77.5*E^1.55 + 35*x[1] + 45*x[2])

# ╔═╡ ecb79e7f-d965-42ad-8f52-151eb5859e8c
md"""
## Define constraints

Create a new cell for each needed constraint. Give each constraint a unique name. If you make a mistake entering the constraint, use the `set_normalized_coefficient` and `set_normalized_rhs` functions to correct the coefficients or the constant. You can also remove constraints using `delete` and `unregister` (use both).
"""

# ╔═╡ 88671baa-52ab-4e72-b74c-e720457f5b89
md"""
Call your model object to see the specification.
"""

# ╔═╡ 6f96f93a-5b29-4b31-8cf7-159e93d17a5a
eutro_model

# ╔═╡ 7f265d7d-fd5d-46e1-8668-3beec2bae104
md"""
# Solve the model

Run the optimization command and query the variable values.
"""

# ╔═╡ 5896d26c-36ed-4adc-b015-933fcc75a2ec
optimize!(eutro_model)

# ╔═╡ e4e190f8-568c-41b7-9651-734037da4c50
# query variable values
value.(E)

# ╔═╡ fcef3aae-6322-4540-8034-0e54e647dd66
value.(x[1])

# ╔═╡ 54317e7f-b164-4f1e-bfd4-3eb7d670bf25
value.(x)

# ╔═╡ 70bb83c6-4b54-47f4-bab5-1e2ffd92ee25
objective_value(eutro_model)


# ╔═╡ Cell order:
# ╟─2f2edce8-1872-11ec-32b3-671bc66f8d3b
# ╠═c21b40dd-f918-4e21-a5b2-e52e5cbb10a0
# ╟─7640589c-56d7-497e-9aa4-74241dd6c560
# ╟─51804401-2ff7-4f96-a25a-5f0e59cf4a53
# ╠═6710634d-208b-4f55-9e47-b4e004514a66
# ╠═1cfcf9bb-cced-4ebd-a885-08c84162740f
# ╟─db8c1aee-fc85-471e-ad33-d07c37d2a013
# ╟─f59a5250-5dc7-4c48-a03c-e19fc524dccb
# ╠═fcfcb9c3-2e82-4ac6-bc54-916fa71066e0
# ╟─70223245-40fc-4755-9233-57d65cf0272a
# ╠═0bb61701-62e8-410d-ae85-7ad5d44d69a7
# ╠═c5ba0f60-1ffc-4fc2-ae66-9147673ee330
# ╠═b14f4e61-c3ce-40ae-97a6-113b39baeeeb
# ╠═1bc66dd0-a5cc-45b3-aa07-1fd3782382b1
# ╟─ecb79e7f-d965-42ad-8f52-151eb5859e8c
# ╟─88671baa-52ab-4e72-b74c-e720457f5b89
# ╠═6f96f93a-5b29-4b31-8cf7-159e93d17a5a
# ╟─7f265d7d-fd5d-46e1-8668-3beec2bae104
# ╠═5896d26c-36ed-4adc-b015-933fcc75a2ec
# ╠═e4e190f8-568c-41b7-9651-734037da4c50
# ╠═fcef3aae-6322-4540-8034-0e54e647dd66
# ╠═54317e7f-b164-4f1e-bfd4-3eb7d670bf25
# ╠═70bb83c6-4b54-47f4-bab5-1e2ffd92ee25
