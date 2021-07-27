### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ ed09c87e-ef0d-11eb-1156-21f7c25537d0
# edit the code below to set your name and Cornell ID (i.e. email without @cornell.edu)

student = (name = "Jazzy Doe", cornell_id = "jazz")

# ╔═╡ eeed11ec-1bac-40d3-b32a-c77fb0acf069
md"""
# Assignment 2

A new pesticide has been developed that is effective in controlling corn, soybean, and wheat pests. As a result of the field experiments, the following crop yields have been obtained:

| **Pesticide Application** (kg/ha) | **Soybean Yields** (kg/ha) | **Wheat Yields** (kg/ha) | **Corn Yields** (kg/ha) |
|:-------------:|:------------:|:-------------:|:---------:|
| 0 | 2900 | 3500 | 5900 |
| 1 | 3800 | 4100 | 6700 |
| 2 | 4400 | 4200 | 7900 |

Annual production costs, **excluding pesticide applications**, and selling prices for the crops are given in the table below.

| **Crop**  | **Annual Production Costs** (\$/ha-yr) | **Selling Prices** (\$/kg)
|:-------------:|:------------:|:-------------:|
| Soybeans | 350 | 0.36 |
| Wheat    | 280 | 0.27 |
| Corn 	   | 390 | 0.22 |

Moreover, pesticide application costs are \$70/ha-yr for any crops at all application rates greater than zero. The demand for each crop is 50,000 kg.

Recently, environmental authorities have expressed concern over the pesticide's ecological impacts and have ruled that a farmer's *average* application rate on corn, soybeans, and wheat cannot exceed 0.6 kg/ha, 0.8 kg/ha, and 0.7 g/ha, respectively.
"""

# ╔═╡ e2c3d306-4364-42bb-815c-629258ae26d9
md"""
## Part 1: Problem Formulation

A farmer has *up to* 130 ha that can be planted with the three crops. Formulate a **linear programming model** to determine how many hectares should be planted with each crop and what the optimal pesticide application rates for each crop should be.

!!! warning
    Make sure that your objective function and all constraints are *linear*.

Your model should include the following 9 variables:
* ``S_j`` = hectares planted with soybeans with pesticide application rate ``j=0,1,2``;

* ``W_j`` = hectares planted with wheat with pesticide application rate ``j=0,1,2``;

* ``C_j`` = hectares planted with corn with pesticide application rate ``j=0,1,2``.
"""

# ╔═╡ ec01a23a-ecd4-4da1-bf10-d16cf3426c96
md"""
Use this block to derive your problem formulation. This is best done with equations supported by some descriptions.
"""

# ╔═╡ e1e062ab-0fb6-456a-ad1c-15961fc06ad3
md"""
Use this block to clearly state the objective function and constraints for your problem in standard form.
"""

# ╔═╡ 43f8f656-a278-412c-8910-079c80a6dd32
md"""
## Part 2: Model Implementation and Solution

Implement your model in JuMP, optimize, and query any relevant quantities. Feel free to add any cells as necessary. Name your model `pesticide_model`.

"""

# ╔═╡ ab3ef648-7022-4b44-bcfd-fb1038feadca
# import any necessary packages here

# ╔═╡ 9590bffd-57e4-4bf1-81be-bc33dd04bda4
# Use this cell to implement your model
begin
	missing # replace this with your code!
end

# ╔═╡ c3a2c21d-d470-4698-ab1d-25f4b50acb1b
optimize!(pesticide_model)

# ╔═╡ 7027c970-960f-4d0d-bdea-7c1fa5e0872a
md"""
## Part 3: Results and Conclusion

Briefly describe the results of your analysis, potentially includeing the final value of the objective function, and if a solution was found (and if so, what it was). What does this solution mean to the decision-maker? Be specific! Discuss what the optimal value(s) of the decision variable(s) mean about the system and recommended strategies.
"""

# ╔═╡ e2969ca5-c0ef-498b-97d9-01cc6f1793c8
md"""
Describe your results here.
"""

# ╔═╡ c99c0045-8bb1-4f28-a4d3-c8036151126c
md"""
## Part 4: Additional Questions
"""

# ╔═╡ 3673af9e-4180-438c-97cc-4630594b7ded
md"""
### Part 4.1

Based on analyses of dual variables, how much would an extra 10 ha be worth to the farmer?
"""

# ╔═╡ 02f936f5-202f-428c-86e7-094a3fde631f
md"""
Describe your answer to this question here.
"""

# ╔═╡ 6ca9bed3-9896-4ceb-8ae5-be7f98a9aa13
md"""
### Part 4.2

If we change the limitation on the farmer's average application on each crop so that the total mass of pesticide applied to all crops divided by the total cropped area must not exceed 0.8 kg/ha, how will the feasible region change?

!!! tip "Modifying and Deleting Constraints"
    Information on how to modify constraints in JuMP can be found [here](https://jump.dev/JuMP.jl/stable/manual/constraints/#Modify-a-constraint). To delete constraints, look at [this part of the documentation](https://jump.dev/JuMP.jl/stable/manual/constraints/#Deleting-constraints).
"""

# ╔═╡ 98e80143-4610-4f16-acee-8cbff2d9e76c
# use this cell to change your constraint implementations
begin
	missing
end

# ╔═╡ 29809bc8-36bd-4c14-8425-c3486119f98a
optimize!(pesticide_model)

# ╔═╡ e5fedfc3-0f32-4f38-b998-8bd9b1d24cdb
md"""
Use this cell to discuss your results. Feel free to add new cells to query any quantities of interest from the model.
"""

# ╔═╡ 58d36070-1980-41aa-add4-a94ab30901f1
md"""
## Citations

If you used any external resource in the process of solving this problem, provide a reference below. These could be other people, websites, datasets, or code examples.
"""

# ╔═╡ 2b19e87b-0b26-4774-8b5b-d1c3f3611407
md"""
List external resources here.
"""

# ╔═╡ Cell order:
# ╠═ed09c87e-ef0d-11eb-1156-21f7c25537d0
# ╟─eeed11ec-1bac-40d3-b32a-c77fb0acf069
# ╟─e2c3d306-4364-42bb-815c-629258ae26d9
# ╠═ec01a23a-ecd4-4da1-bf10-d16cf3426c96
# ╠═e1e062ab-0fb6-456a-ad1c-15961fc06ad3
# ╟─43f8f656-a278-412c-8910-079c80a6dd32
# ╠═ab3ef648-7022-4b44-bcfd-fb1038feadca
# ╠═9590bffd-57e4-4bf1-81be-bc33dd04bda4
# ╠═c3a2c21d-d470-4698-ab1d-25f4b50acb1b
# ╟─7027c970-960f-4d0d-bdea-7c1fa5e0872a
# ╠═e2969ca5-c0ef-498b-97d9-01cc6f1793c8
# ╟─c99c0045-8bb1-4f28-a4d3-c8036151126c
# ╟─3673af9e-4180-438c-97cc-4630594b7ded
# ╠═02f936f5-202f-428c-86e7-094a3fde631f
# ╠═6ca9bed3-9896-4ceb-8ae5-be7f98a9aa13
# ╠═98e80143-4610-4f16-acee-8cbff2d9e76c
# ╠═29809bc8-36bd-4c14-8425-c3486119f98a
# ╠═e5fedfc3-0f32-4f38-b998-8bd9b1d24cdb
# ╟─58d36070-1980-41aa-add4-a94ab30901f1
# ╠═2b19e87b-0b26-4774-8b5b-d1c3f3611407
