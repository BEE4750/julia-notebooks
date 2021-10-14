### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 3f54a71c-06aa-11ec-3712-0dbdbf56b590
# edit the code below to set your name and Cornell ID (i.e. email without @cornell.edu)

student = (name = "Jazzy Doe", cornell_id = "jazz")

# ╔═╡ daf6f050-6fe5-474b-b83c-bc14870b6efb
md"""
# Assignment 5

A river is receiving waste discharges from two sources that are 15km apart, as shown in the Figure below. Characteristics of the river inflow and waste discharges are given in the table, and the values of ``k_a``, ``k_c``, and ``k_n`` are 0.55, 0.35, and 0.25 per day, respectively.

"""

# ╔═╡ 409babef-def0-49a6-a82f-552e3dfb0a3a
md"""
**Table 1**
"""

# ╔═╡ 4651f993-b5da-4c04-9d0e-2c021b3d2732
md"""
| **Parameter** | **River Inflow** | **Waste Stream 1** | **Waste Stream 2 ** | 
|:-------------:|:------------:|:-------------:|:---------:|
| ``Q`` 		 		| 100,000 ``m^3d`` | 10,000 ``m^3d`` | 15,000 ``m^3d`` |
| ``DO`` 		 		| 350 mg/L 		   | 5 mg/L 		 | 5 mg/L  		   |
| ``CBOD``		 		| 150 mg/L 		   | 50 mg/L 		 | 45 mg/L  	   |
| ``NBOD``		 		| 150 mg/L 		   | 35 mg/L 		 | 35 mg/L  	   |
| ``DO_{Saturated}``		| 150 mg/L 		   |     -  		 |    -   		   |
"""

# ╔═╡ 43b15cf7-0b54-4873-8ef4-828e63de6a95
md"""
## Part 1

Determine how long (in distance) it takes for the DO of the river to recover to the regulated level of 6mg/L if the waste is untreated.
"""

# ╔═╡ 9f1fcbbb-c856-42e9-a53d-fbfd7a0846de
md"""
## Part 2
What is the minimum level of treatment (% removal) for waste stream 2 that will ensure that the ``DO`` level never drops below 4 mg/L, with waste stream 1 untreated?

"""

# ╔═╡ b4bda1ca-25d4-4384-a054-f7a18cd2af29
md"""
## Part 3: 
What is the minimum level of equal treatment (% removal) of the two sources that will ensure that the ``DO`` level never drops below 4 mg/L?

"""

# ╔═╡ c682b9cf-1c5f-43d3-aa5d-abe34469fc5d
md"""
## Part 4: 
If the ``CBOD`` values entering the river upstream are known to vary uniformly between ``\pm 20\%`` of the value given in the table, what is the (approximate) likelihood that the ``DO`` will drop below 4 mg/L under the treatment strategy you proposed for Part 3?
"""

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
# ╟─409babef-def0-49a6-a82f-552e3dfb0a3a
# ╟─4651f993-b5da-4c04-9d0e-2c021b3d2732
# ╟─43b15cf7-0b54-4873-8ef4-828e63de6a95
# ╟─9f1fcbbb-c856-42e9-a53d-fbfd7a0846de
# ╟─b4bda1ca-25d4-4384-a054-f7a18cd2af29
# ╟─c682b9cf-1c5f-43d3-aa5d-abe34469fc5d
# ╠═0cbd3384-1ff8-434e-b081-8a0ec326e1a3
# ╠═b979c498-3335-4766-9025-cc402ff91a37
# ╠═459f424f-3700-4832-a665-c9c5659de2b1
