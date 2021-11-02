### A Pluto.jl notebook ###
# v0.16.4

using Markdown
using InteractiveUtils

# ╔═╡ 5a559244-7d94-43a5-b795-b4116ef0f96c
using PlutoUI

# ╔═╡ 3f54a71c-06aa-11ec-3712-0dbdbf56b590
# edit the code below to set your name and Cornell ID (i.e. email without @cornell.edu)

student = (name = "Jazzy Doe", cornell_id = "jazz")

# ╔═╡ daf6f050-6fe5-474b-b83c-bc14870b6efb
md"""
# Assignment 5

A river is receiving waste discharges from two sources that are 15km apart, as shown in the Figure below. Characteristics of the river inflow and waste discharges are given in the table, and the values of ``k_a``, ``k_c``, and ``k_n`` are 0.55, 0.35, and 0.25 per day, respectively.

"""

# ╔═╡ d1568180-4b89-48af-a57f-292cf122f951
Resource("https://i.imgur.com/yZPm5nc.png")

# ╔═╡ 409babef-def0-49a6-a82f-552e3dfb0a3a
md"""
**Table 1**
"""

# ╔═╡ 4651f993-b5da-4c04-9d0e-2c021b3d2732
md"""
| **Parameter** | **River Inflow** | **Waste Stream 1** | **Waste Stream 2 ** | 
|:-------------:|:------------:|:-------------:|:---------:|
| ``Q`` 		 		| 100,000 ``m^3d`` | 10,000 ``m^3d`` | 15,000 ``m^3d`` |
| ``DO`` 		 		| 7.5 mg/L 		   | 5 mg/L 		 | 5 mg/L  		   |
| ``CBOD``		 		| 5 mg/L 		   | 50 mg/L 		 | 45 mg/L  	   |
| ``NBOD``		 		| 5 mg/L 		   | 35 mg/L 		 | 35 mg/L  	   |
| ``DO_{Saturated}``		| 10 mg/L 		   |     -  		 |    -   		   |
"""

# ╔═╡ 43b15cf7-0b54-4873-8ef4-828e63de6a95
md"""
## Part 1

Determine how long (in distance) it takes for the DO of the river to recover to the regulated level of 6mg/L after waste stream 2 if the waste is untreated.
"""

# ╔═╡ 36364b89-de3a-432e-ab7d-642ebb00fcaa


# ╔═╡ 9f1fcbbb-c856-42e9-a53d-fbfd7a0846de
md"""
## Part 2
What is the minimum level of treatment (% removal) for waste stream 2 that will ensure that the ``DO`` level never drops below 4 mg/L, with waste stream 1 untreated?

"""

# ╔═╡ 0cbd3384-1ff8-434e-b081-8a0ec326e1a3
md"""
Use this cell to discuss your results. Feel free to add new cells to query any quantities of interest from the model.
"""

# ╔═╡ b4bda1ca-25d4-4384-a054-f7a18cd2af29
md"""
## Part 3: 
What is the minimum level of equal treatment (% removal) of the two sources required to ensure that the ``DO`` level never drops below 4 mg/L?

"""

# ╔═╡ bb366047-1b9c-4751-88a7-07bb4bb34745


# ╔═╡ c682b9cf-1c5f-43d3-aa5d-abe34469fc5d
md"""
## Part 4: 
If the ``CBOD``  and ``NBOD`` values entering the river inflow are known to vary uniformly between ``[-30\%,20\%]`` of the value given in the table, what is your estimate for the probability that the ``DO`` will drop below 4 mg/L under the treatment strategy you proposed for Part 3?
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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.17"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "5efcf53d798efede8fee5b2c8b09284be359bf24"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.2"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "d911b6a12ba974dabe2291c6d450094a7226b372"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.1"

[[PlutoUI]]
deps = ["Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "615f3a1eff94add4bca9476ded096de60b46443b"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.17"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[Test]]
deps = ["Distributed", "InteractiveUtils", "Logging", "Random"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═3f54a71c-06aa-11ec-3712-0dbdbf56b590
# ╟─daf6f050-6fe5-474b-b83c-bc14870b6efb
# ╟─5a559244-7d94-43a5-b795-b4116ef0f96c
# ╟─d1568180-4b89-48af-a57f-292cf122f951
# ╟─409babef-def0-49a6-a82f-552e3dfb0a3a
# ╟─4651f993-b5da-4c04-9d0e-2c021b3d2732
# ╠═43b15cf7-0b54-4873-8ef4-828e63de6a95
# ╠═36364b89-de3a-432e-ab7d-642ebb00fcaa
# ╟─9f1fcbbb-c856-42e9-a53d-fbfd7a0846de
# ╠═0cbd3384-1ff8-434e-b081-8a0ec326e1a3
# ╟─b4bda1ca-25d4-4384-a054-f7a18cd2af29
# ╠═bb366047-1b9c-4751-88a7-07bb4bb34745
# ╠═c682b9cf-1c5f-43d3-aa5d-abe34469fc5d
# ╠═b979c498-3335-4766-9025-cc402ff91a37
# ╠═459f424f-3700-4832-a665-c9c5659de2b1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
