### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 3f54a71c-06aa-11ec-3712-0dbdbf56b590
# edit the code below to set your name and Cornell ID (i.e. email without @cornell.edu)

student = (name = "Jazzy Doe", cornell_id = "jazz")

# ╔═╡ daf6f050-6fe5-474b-b83c-bc14870b6efb
md"""
# Assignment 4

Two cities are developing a coordinated municipal solid waste (MSW) disposal plan.  Three disposal alternatives are being considered: a landfills (LF), a materials recycling facility (MRF), and a waste-to-energy facility (WTE). 

| **Disposal Facility** | **Capacity** (Mg/d) | **Fixed cost** (\$/d) | **Tipping Fee ** (\$/Mg) | **Recycling Cost** (\$/Mg) |
|:-------------:|:------------:|:-------------:|:---------:|:--------------:|
| Landfill 					| 300 | 2000 | 50 |					   |
| Recycling Facility 		| 350 | 1500 | 7  |45 (per Mg recycled)|
| Waste-to-Energy Facility  | 150 | 2500 | 60 |					   |

Transportation costs are $1.5/Mg-km, and the relative distances between the cities and facilities are provided in the table below. 

| **City/Facility**  | **MRF**  | **Landfill** | **WTE** |
|:-------------:|:------------:|:-------------:|:-------------:|
| 1  	  | 5  | 30 | 15 |
| 2 	  | 15 | 25 | 10 |
| MRF	  | -  | 32 | 15 |
| LF	  | 32 | -  | 18 |
| WTE	  | 15 | 18 | -  |
The fixed costs associated with the disposal options are incurred only if the particular disposal option is implemented.  The cities produce 100 and 170 Mg/day of solid waste, respectively, with the composition provided in the table below. 

| **Component**  | **% of total mass**  | **Combustion ash** (%) | **MRF Recycling rate** (%) |
|:-------------------:|:------------:|:-------------:|:-------------:|
| Food Wastes  	  	  | 15  | 8   | 0   |
| Paper & Cardboard	  | 40  | 7   | 55  |
| Plastics	  		  | 5   | 5   | 15  |
| Textiles	   		  | 3   | 10  | 10  |
| Rubber, Leather	  | 2   | 15  | 0   |
| Wood		  		  | 5   | 2   | 30  |
| Yard Wastes	  	  | 18  | 2   | 40  |
| Glass	  			  | 4   | 100 | 60  |
| Ferrous	  		  | 2   | 100 | 75  |
| Aluminum	  		  | 2   | 100 | 80  |
| Other Metal	  	  | 1   | 100 | 50  |
| Miscellaneous	  	  | 3   | 70  | 0   |
The information in Table 3 will help you determine the overall recycling and ash fractions. Note that the recycling residuals, which may be sent to either landfill or the WTE, have different ash content than the ash content of the original MSW. You will need to determine these fractions to construct your mass balance constraints. 
"""

# ╔═╡ 43b15cf7-0b54-4873-8ef4-828e63de6a95
md"""
## Part 1: Determine An Optimal Disposal Plan

Determine an optimal disposal plan for the two cities, using the data provided above.
"""

# ╔═╡ e1c6bd45-457a-4cac-a295-f16d045caaed
md"""
Use this block to derive your problem formulation. This is best done with equations supported by some descriptions.
"""

# ╔═╡ 88c6da01-e138-4f6d-9263-61963ec9b962
md"""
Use this block to clearly state the objective function and constraints for your problem in standard form.
"""

# ╔═╡ 58cf34d0-a32d-4c38-b766-2d63370ed45b
md"""

Implement your model in JuMP, optimize, and query any relevant quantities. Feel free to add any cells as necessary. Name your model `waste_allocation`.

"""

# ╔═╡ dd2164bf-b47b-434e-ae56-e291ee5ef5c1
# import any necessary packages here

# ╔═╡ e3061b60-5824-4b4f-8143-d6ba2d52444a
# Use this cell to implement your model
begin
	missing # replace this with your code!
end

# ╔═╡ 2b4129bf-05d8-418e-81cb-fbd165efbc86
optimize!(waste_allocation)

# ╔═╡ c7f37854-93f2-4cac-a209-0278cb0ae496
md"""
## Part 2: Modifiy Your Plan with Carbon Tax 

It is projected that in the near future the state will introduce a carbon tax that will increase the cost for transportation and for disposal by incineration. It is estimated that the additional costs for the WTE facility will translate to an increase in tipping fees to 75\$/Mg, and transportation costs will increase to \$2/Mg-km. Discuss how this policy change will influence your recommendation.  

!!! tip "Modifying and Deleting Constraints"
    Information on how to modify constraints in JuMP can be found [here](https://jump.dev/JuMP.jl/stable/manual/constraints/#Modify-a-constraint). To delete constraints, look at [this part of the documentation](https://jump.dev/JuMP.jl/stable/manual/constraints/#Deleting-constraints).
"""

# ╔═╡ 012d4949-f7fc-4022-a302-6ed9447e5c49
# use this cell to change your constraint implementations
begin
	missing
end

# ╔═╡ 42d1333c-1bd9-4a09-89bc-140189ac566d
optimize!(waste_allocation)

# ╔═╡ 0cbd3384-1ff8-434e-b081-8a0ec326e1a3
md"""
Use this cell to discuss your results. Feel free to add new cells to query any quantities of interest from the model.
"""

# ╔═╡ b979c498-3335-4766-9025-cc402ff91a37
md"""
## Citations

If you used any external resource in the process of solving this problem, provide a reference below. These could be other people, websites, datasets, or code examples.
"""

# ╔═╡ 459f424f-3700-4832-a665-c9c5659de2b1
md"""
List external resources here.
"""

# ╔═╡ Cell order:
# ╠═3f54a71c-06aa-11ec-3712-0dbdbf56b590
# ╟─daf6f050-6fe5-474b-b83c-bc14870b6efb
# ╠═43b15cf7-0b54-4873-8ef4-828e63de6a95
# ╠═e1c6bd45-457a-4cac-a295-f16d045caaed
# ╠═88c6da01-e138-4f6d-9263-61963ec9b962
# ╠═58cf34d0-a32d-4c38-b766-2d63370ed45b
# ╠═dd2164bf-b47b-434e-ae56-e291ee5ef5c1
# ╠═e3061b60-5824-4b4f-8143-d6ba2d52444a
# ╠═2b4129bf-05d8-418e-81cb-fbd165efbc86
# ╟─c7f37854-93f2-4cac-a209-0278cb0ae496
# ╠═012d4949-f7fc-4022-a302-6ed9447e5c49
# ╠═42d1333c-1bd9-4a09-89bc-140189ac566d
# ╠═0cbd3384-1ff8-434e-b081-8a0ec326e1a3
# ╠═b979c498-3335-4766-9025-cc402ff91a37
# ╠═459f424f-3700-4832-a665-c9c5659de2b1
