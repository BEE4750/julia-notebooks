### A Pluto.jl notebook ###
# v0.16.0

using Markdown
using InteractiveUtils

# ╔═╡ eeabbe5a-11b4-465e-9f12-756ae8effb04
begin 
	import Pkg
	using ColorTypes
	using Images
end

# ╔═╡ d61afe24-df30-11eb-3a5c-37f756dfed94
# edit the code below to set your name and ID (your email without @cornell.edu)

student = (name = "Jazzy Doe", cornell_id = "jd999")

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running.
# scroll down the page to see what's up

# ╔═╡ 2c1ef457-723c-48cf-8449-3888df55094c
md"""
# Homework 0: Introduction to Julia

This homework assignment is intended to make sure you're familiar with the basics of Julia and programming, so you can hit the ground running in BEE 4750/5750. You'll get instant feedback on the problems, and they will be graded based on completion. After completing the assignment, upload to Canvas as proof of completion.
"""

# ╔═╡ 77587301-f2d5-40f3-b460-8f74dbecb13f
md"""
## Problem 1: Newton's Method for Computing Square Roots

!!! note 
    This problem was taken from MIT's [Introduction to Computational Thinking](https://computationalthinking.mit.edu/Fall20/) course, which is aimed at applying scientific computing with Julia to real scientific problems, such as climate modeling.

Newton's method is an iterative algorithm to finding roots of functions. For finding the square root of a positive number $x$, this simplifies to the following algorithm:

1. Start with some guess $a$.
2. Divide $x$ by $a$.
3. Set $a$ to be the mean of $x/a$ and $a$ (why must the square root be between $x/a$ and $a$?).
4. Repeat until $x/a$ is close to $a$.
5. Return $a$ as the approximation to the square root.

In general, due to issues of computational precision and iterative approximation, it is unlikely that you will exactly get $x/a$ to equal $a$, which means if Step 4 was for the two terms to be equal, you would get an infinite loop. Instead, we set some error threshold parameter which determines when the two values are close enough for the approximation to be sufficient.

"""

# ╔═╡ 68c689cd-0ea9-4c25-a18d-aadca00fc75f
md"""
Now, write a function `newton_sqrt()` which implements the above algorithm to estimate `sqrt(2)` within an error tolerance of 0.01. We'll assume the starting guess is $x/2$.
"""

# ╔═╡ 4333a6f8-033e-4967-b8e6-61158448dfc0
function newton_sqrt(x, error_margin=0.01, a=x/2)
	return x # This isn't right, so replace this with your code
end

# ╔═╡ a9c2f5b9-9760-420a-9fd2-14301ae0b924
newton_sqrt(2)

# ╔═╡ d914431d-e4fa-4bf6-b91b-3c1dc64ceeed
let
	result = newton_sqrt(2, 0.01)
	if !(result isa Number)
		md"""
!!! warning "Answer not a number"
    `newton_sqrt` did not return a number. Did you forget to return a value?
		"""
	elseif abs(result - sqrt(2)) < 0.01
		md"""
!!! correct
    Well done! You got the correct answer.
		"""
	else
		md"""
!!! warning "Incorrect answer"
    Keep going!
		"""
	end
end
		

# ╔═╡ aa404537-2517-4bbd-9130-e9ace5e30679
md"""
## Problem 2: Manipulating Vectors
"""

# ╔═╡ 998904c0-3b4d-443a-be89-ed8e0e2506ee
md"""
### Problem 2.1

Create a random vector `random_vect` of length 10 using the `rand` function.
"""

# ╔═╡ c51ebdd5-715c-4933-9449-373f05a7e116
random_vect = missing # replace this with your code

# ╔═╡ ba536770-f7ba-42bf-a65d-22df9e014583
if !@isdefined(random_vect)
		md"""
!!! warning "Variable or function not defined!"
    `random_vect` is not defined! Make sure you did not delete the definition of `random_vect` when you added your code.
"""

elseif ismissing(random_vect)
	md"""
!!! warning "Here we go!"
    Replace `missing` with your code.
    """
elseif !(random_vect isa Vector)
	md"""
!!! warning "Keep working!"
    `random_vect` should be a `Vector`.
	"""
elseif eltype(random_vect) != Float64
	md"""
!!! warning "Almost!"
    For the remaining parts of this problem, we want a vector of `Float64` numbers. Your vector elements have a different type; perhaps they're integers.
	
    The (optional) first argument to `rand` specifies the **type** of elements to generate. For example: `rand(Bool, 10)` generates 10 values that are either `true` or `false`.
	"""
elseif length(random_vect) != 10
	md"""
!!! warning "Keep working!"
    `random_vect` does not have the correct size.
    """
elseif length(Set(random_vect)) != 10
	md"""
!!! warning "Keep working!"
	`random_vect` is not "random enough." How can you make it more random?
	"""
else
	md"""
!!! correct
    Well done! Running your code again using the ▶ button (or by hitting Shift+Enter) will generate another random vector.
"""
end

# ╔═╡ b322b496-70ec-4f54-9de8-55ca6be989eb
md"""
### Problem 2.2: 
Make a function `mean` which computes the arithmetic mean of a vector of numbers using a `for` loop.
"""

# ╔═╡ 159fbf51-71ec-41ce-a7c3-8d1e8ed6e1ee
function mean(vect)
	return missing
end

# ╔═╡ f487d112-89a8-4e0b-b172-7ca9a5e485a2
mean([1,2,3])

# ╔═╡ 7207f68f-bc73-4ae9-8a5d-536902b154b5
if !@isdefined(mean)
	md"""
!!! warning "Variable or function not defined!"
   `mean` is not defined! Make sure you did not delete the definition of `mean` when you added your code.
"""
else
	let
		result = mean([1,2,3])
		if ismissing(result)
			md"""
!!! warning "Here we go!"
    Replace `return missing` with your code.
			"""
		elseif isnothing(result)
			md"""
!!! warning "Your function doesn't return anything!"
	    	"""
		elseif result != 2
			md"""
!!! warning "Keep working!"
			"""
		else
			md"""
!!! correct
    Well done!
			"""
		end
	end
end

# ╔═╡ dad220a9-f476-4940-9446-41dcdeeb3e29
md"""
### Problem 2.2

Write a function `demean` which takes a vector `vect` and subtracts the mean from each value in `vect`.

!!! tip "Mutating functions"
    When writing `demean`, keep in mind what you've learned about Julia conventions around mutating functions!
"""

# ╔═╡ 4507899e-590c-4463-ba50-e15ce2b7f0a1
function demean(vect)
	return missing
end

# ╔═╡ 69a929b1-5ffe-4826-9828-dcaac2942564
test_vect = let
	
	# feel free to change your test case here!
	to_create = [-1.0, -1.5, 5.25]
	
	
	####
	# this cell is a bit funky to deal with a common pitfall from last year
	# it regenerates the vector if you accidentally wrote a mutating function
	
	# don't worry about how it works for this exercise!
	
	demean
	to_create
end

# ╔═╡ 7f2de5e2-c151-4c6c-9090-878a30bec5c5
md"""
Check your code by making sure that `demean(test_vect)` is close enough to zero.

!!! note
    Why might `demean(test_vect)` not be precisely zero, even if your code is right?
"""

# ╔═╡ 84b67ef8-770d-4d2c-9213-39eccfb76055
mean(demean(test_vect))

# ╔═╡ 6fb8cc01-355d-48a9-b142-c7625dd4482f
if !@isdefined(mean)
	not_defined(:mean)
else
	let
		input = Float64[1,2,3]
		result = demean(input)
		
		if input === result
			md"""
!!! warning "Almost!"
    It looks like you **modified** `vect` inside the function.
			
    It is preferable to avoid mutation inside functions, because you might want to use the original data again. For example, applying `demean` to a dataset of sensor readings would **modify** the original data, and the rest of your analysis would be erroneous.
			
    Different programming languages define the **scope** of variables and operations within functions differently from others. In Julia, you can affect data outside of a function by modifying them within the function, so be careful!			
    """
		elseif ismissing(result)
			md"""
!!! warning "Here we go!"
    """
		elseif isnothing(result)
			md"""
!!! warning "Your function doesn't return anything!"
    """
		elseif !(result isa AbstractVector) || length(result) != 3
			md"""
!!! warning "Keep working!"
    Your answer should be a vector of the same size as `vect`.
    """
		elseif abs(sum(result) / 3) < 1e-10
			md"""
!!! correct "Well done!"
    """
		else
			md"""
!!! warning "Keep working!"
    """
		end
	end
end

# ╔═╡ e5460dcb-966f-4e95-9867-1b7193635969
md"""
### Problem 2.3: 
Generate a vector of 100 elements where
* the center 10 elements are set to 1
* all other elements are 0.
"""

# ╔═╡ ea841914-5346-4a1b-8610-c5b1fd117eab
function create_center_ones()
	return missing
end

# ╔═╡ 65080739-0552-473b-b85a-d5331e9a4707
create_center_ones()

# ╔═╡ b69a9d0d-1a9f-4b0e-81dd-37ca6046dd8d
if !@isdefined(create_center_ones)
		md"""
!!! warning "Variable or function not defined!"
   `create_center_ones` is not defined! Make sure you did not delete the definition of `create_center_ones` when you added your code.
        """
else
	let
		result = create_center_ones()
		if ismissing(result)
			md"""
!!! warning "Here we go!"
    Replace `return missing` with your code.
    """	
		elseif isnothing(result)
			md"""
!!! warning "Keep working!"
    Your function doesn't return anything!
    """
		elseif !(result isa Vector) || length(result) != 100
			md"""
!!! warning "Keep working!"
    The result should be a `Vector` with 100 elements.
    """
		elseif all(x->x==0, result[1:45]) && all(x->x==1, result[46:55]) && all(x->x==0, result[56:100])
			md"""
!!! correct "Well done!"
	"""
		else
			md"""
!!! warning "Keep working!"
	"""
		end
	end
end

# ╔═╡ 538245ad-af10-48dd-b25a-43acb4197f06
md"""
## Problem 3: Manipulating images (but really matrices)

In Julia, images are really matrices (2d arrays) of `RGB` objects, which encode red, green, and blue values (between 0 and 1). To work with colors, we need to load the `ColorTypes` package. And to visualize colors, we need to install and load the `Images` package.

Pluto will automatically download and install packages, but typically you'd need to install packages using the `Pkg` package manager or the package management prompt. The first time you run this block, it could take a little bit of time to download and install everything.
"""

# ╔═╡ 8bcfd536-2be2-4658-96c5-b11605616033
md"""
To create an `RGB` object:
"""

# ╔═╡ 85a602f4-b5ba-4332-9a4e-7e0be2bd7bbd
test_color = RGB(0.25, 0.6, 0.4)

# ╔═╡ f844ccbf-21ad-4d63-bb0c-9f324a46569f
md"""
The values of the individual color channels are available using the `r`, `g`, and `b` attributes:
"""

# ╔═╡ 1c4613bb-651c-4ade-a233-23a802da2c02
test_color.r, test_color.g, test_color.b

# ╔═╡ c95afab0-c51a-4799-8419-9ecda95f8d99
md"""
### Problem 3.1:

👉 Write a function `get_red` that takes a single pixel and returns the value of its red channel.
"""

# ╔═╡ 0e228c0a-0792-45ed-94a5-0a5585245222
function get_red(pixel::AbstractRGB)
	return missing # replace with your code
end

# ╔═╡ 55794efb-df8f-45ea-8b2c-417b15fbe556
get_red(RGB(0.8, 0.1, 0.0))

# ╔═╡ 2bad98c1-5efe-4058-8a33-38ec39d36261
let
	result = get_red(RGB(0.2, 0.3, 0.4))
	if ismissing(result)
		md"""
!!! warning "Here we go!"
    Replace `return missing` with your code.
    """	
	elseif isnothing(result)
		md"""
!!! warning "Keep working!"
    Your function doesn't return anything!
    """
	elseif result == 0.2
		md"""
!!! correct "Well done!"
	"""
	else
		md"""
!!! warning "Keep working!"
	"""
	end
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
ColorTypes = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
Images = "916415d5-f1e6-5110-898d-aaa5f9f070e0"
Pkg = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[compat]
ColorTypes = "~0.11.0"
Images = "~0.24.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "485ee0867925449198280d4af84bdb46a2a404d0"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.0.1"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArrayInterface]]
deps = ["IfElse", "LinearAlgebra", "Requires", "SparseArrays", "Static"]
git-tree-sha1 = "d84c956c4c0548b4caf0e4e96cf5b6494b5b1529"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "3.1.32"

[[Artifacts]]
deps = ["Pkg"]
git-tree-sha1 = "c30985d8821e0cd73870b17b0ed0ce6dc44cb744"
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.3.0"

[[AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "a4d07a1c313392a77042855df46c5f534076fab9"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.0"

[[AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "d127d5e4d86c7680b20c35d40b503c74b9a39b5e"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.4"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[CEnum]]
git-tree-sha1 = "215a9aa4a1f23fbd05b92769fdd62559488d70e9"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.1"

[[CatIndices]]
deps = ["CustomUnitRanges", "OffsetArrays"]
git-tree-sha1 = "a0f80a09780eed9b1d106a1bf62041c2efc995bc"
uuid = "aafaddc9-749c-510e-ac4f-586e18779b91"
version = "0.2.2"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "4ce9393e871aca86cc457d9f66976c3da6902ea7"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.4.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "a66a8e024807c4b3d186eb1cab2aff3505271f8e"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.6"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "4866e381721b30fac8dda4c8cb1d9db45c8d2994"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.37.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "8e695f735fca77e9708e795eda62afdb869cbb70"
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.3.4+0"

[[ComputationalResources]]
git-tree-sha1 = "52cb3ec90e8a8bea0e62e275ba577ad0f74821f7"
uuid = "ed09eef8-17a6-5b46-8889-db040fac31e3"
version = "0.3.2"

[[CoordinateTransformations]]
deps = ["LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "6d1c23e740a586955645500bbec662476204a52c"
uuid = "150eb455-5306-5404-9cee-2592286d6298"
version = "0.6.1"

[[CustomUnitRanges]]
git-tree-sha1 = "1a3f97f907e6dd8983b744d2642651bb162a3f7a"
uuid = "dc8bdbbb-1ca9-579f-8c36-e416f6a65cce"
version = "1.0.2"

[[DataAPI]]
git-tree-sha1 = "bec2532f8adb82005476c141ec23e921fc20971b"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.8.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distances]]
deps = ["LinearAlgebra", "Statistics", "StatsAPI"]
git-tree-sha1 = "9f46deb4d4ee4494ffb5a40a27a2aced67bdd838"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.4"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[EllipsisNotation]]
deps = ["ArrayInterface"]
git-tree-sha1 = "8041575f021cba5a099a456b4163c9a08b566a02"
uuid = "da5c29d0-fa7d-589e-88eb-ea29b0a81949"
version = "1.1.0"

[[FFTViews]]
deps = ["CustomUnitRanges", "FFTW"]
git-tree-sha1 = "70a0cfd9b1c86b0209e38fbfe6d8231fd606eeaf"
uuid = "4f61f5a4-77b1-5117-aa51-3ab5ef4ef0cd"
version = "0.3.1"

[[FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "IntelOpenMP_jll", "Libdl", "LinearAlgebra", "MKL_jll", "Reexport"]
git-tree-sha1 = "1b48dbde42f307e48685fa9213d8b9f8c0d87594"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.3.2"

[[FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3676abafff7e4ff07bbd2c42b3d8201f31653dcc"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.9+8"

[[FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "3c041d2ac0a52a12a27af2782b34900d9c3ee68c"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.11.1"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "2c1cf4df419938ece72de17f368a021ee162762e"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.0"

[[IdentityRanges]]
deps = ["OffsetArrays"]
git-tree-sha1 = "be8fcd695c4da16a1d6d0cd213cb88090a150e3b"
uuid = "bbac6d45-d8f3-5730-bfe4-7a449cd117ca"
version = "0.3.1"

[[IfElse]]
git-tree-sha1 = "28e837ff3e7a6c3cdb252ce49fb412c8eb3caeef"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.0"

[[ImageAxes]]
deps = ["AxisArrays", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "794ad1d922c432082bc1aaa9fa8ffbd1fe74e621"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.9"

[[ImageContrastAdjustment]]
deps = ["ColorVectorSpace", "ImageCore", "ImageTransformations", "Parameters"]
git-tree-sha1 = "2e6084db6cccab11fe0bc3e4130bd3d117092ed9"
uuid = "f332f351-ec65-5f6a-b3d1-319c6670881a"
version = "0.3.7"

[[ImageCore]]
deps = ["AbstractFFTs", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "db645f20b59f060d8cfae696bc9538d13fd86416"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.8.22"

[[ImageDistances]]
deps = ["ColorVectorSpace", "Distances", "ImageCore", "ImageMorphology", "LinearAlgebra", "Statistics"]
git-tree-sha1 = "6378c34a3c3a216235210d19b9f495ecfff2f85f"
uuid = "51556ac3-7006-55f5-8cb3-34580c88182d"
version = "0.2.13"

[[ImageFiltering]]
deps = ["CatIndices", "ColorVectorSpace", "ComputationalResources", "DataStructures", "FFTViews", "FFTW", "ImageCore", "LinearAlgebra", "OffsetArrays", "Requires", "SparseArrays", "StaticArrays", "Statistics", "TiledIteration"]
git-tree-sha1 = "bf96839133212d3eff4a1c3a80c57abc7cfbf0ce"
uuid = "6a3955dd-da59-5b1f-98d4-e7296123deb5"
version = "0.6.21"

[[ImageIO]]
deps = ["FileIO", "Netpbm", "OpenEXR", "PNGFiles", "TiffImages", "UUIDs"]
git-tree-sha1 = "13c826abd23931d909e4c5538643d9691f62a617"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.5.8"

[[ImageMagick]]
deps = ["FileIO", "ImageCore", "ImageMagick_jll", "InteractiveUtils", "Libdl", "Pkg", "Random"]
git-tree-sha1 = "5bc1cb62e0c5f1005868358db0692c994c3a13c6"
uuid = "6218d12a-5da1-5696-b52f-db25d2ecc6d1"
version = "1.2.1"

[[ImageMagick_jll]]
deps = ["JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pkg", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "1c0a2295cca535fabaf2029062912591e9b61987"
uuid = "c73af94c-d91f-53ed-93a7-00f77d67a9d7"
version = "6.9.10-12+3"

[[ImageMetadata]]
deps = ["AxisArrays", "ColorVectorSpace", "ImageAxes", "ImageCore", "IndirectArrays"]
git-tree-sha1 = "ae76038347dc4edcdb06b541595268fca65b6a42"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.5"

[[ImageMorphology]]
deps = ["ColorVectorSpace", "ImageCore", "LinearAlgebra", "TiledIteration"]
git-tree-sha1 = "68e7cbcd7dfaa3c2f74b0a8ab3066f5de8f2b71d"
uuid = "787d08f9-d448-5407-9aad-5290dd7ab264"
version = "0.2.11"

[[ImageQualityIndexes]]
deps = ["ColorVectorSpace", "ImageCore", "ImageDistances", "ImageFiltering", "OffsetArrays", "Statistics"]
git-tree-sha1 = "1198f85fa2481a3bb94bf937495ba1916f12b533"
uuid = "2996bd0c-7a13-11e9-2da2-2f5ce47296a9"
version = "0.2.2"

[[ImageShow]]
deps = ["Base64", "FileIO", "ImageCore", "OffsetArrays", "Requires", "StackViews"]
git-tree-sha1 = "832abfd709fa436a562db47fd8e81377f72b01f9"
uuid = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
version = "0.3.1"

[[ImageTransformations]]
deps = ["AxisAlgorithms", "ColorVectorSpace", "CoordinateTransformations", "IdentityRanges", "ImageCore", "Interpolations", "OffsetArrays", "Rotations", "StaticArrays"]
git-tree-sha1 = "e4cc551e4295a5c96545bb3083058c24b78d4cf0"
uuid = "02fcd773-0e25-5acc-982a-7f6622650795"
version = "0.8.13"

[[Images]]
deps = ["AxisArrays", "Base64", "ColorVectorSpace", "FileIO", "Graphics", "ImageAxes", "ImageContrastAdjustment", "ImageCore", "ImageDistances", "ImageFiltering", "ImageIO", "ImageMagick", "ImageMetadata", "ImageMorphology", "ImageQualityIndexes", "ImageShow", "ImageTransformations", "IndirectArrays", "OffsetArrays", "Random", "Reexport", "SparseArrays", "StaticArrays", "Statistics", "StatsBase", "TiledIteration"]
git-tree-sha1 = "8b714d5e11c91a0d945717430ec20f9251af4bd2"
uuid = "916415d5-f1e6-5110-898d-aaa5f9f070e0"
version = "0.24.1"

[[Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "87f7662e03a649cffa2e05bf19c303e168732d3e"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.2+0"

[[IndirectArrays]]
git-tree-sha1 = "c2a145a145dc03a7620af1444e0264ef907bd44f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "0.5.1"

[[Inflate]]
git-tree-sha1 = "f5fc07d4e706b84f72d54eedcc1c13d92fb0871c"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.2"

[[IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d979e54b71da82f3a65b62553da4fc3d18c9004c"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2018.0.3+2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[Interpolations]]
deps = ["AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "61aa005707ea2cebf47c8d780da8dc9bc4e0c512"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.13.4"

[[IntervalSets]]
deps = ["Dates", "EllipsisNotation", "Statistics"]
git-tree-sha1 = "3cc368af3f110a767ac786560045dceddfc16758"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.5.3"

[[IrrationalConstants]]
git-tree-sha1 = "f76424439413893a832026ca355fe273e93bce94"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.0"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9aff0587d9603ea0de2c6f6300d9f9492bbefbd3"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.0.1+3"

[[LazyArtifacts]]
deps = ["Pkg"]
git-tree-sha1 = "4bb5499a1fc437342ea9ab7e319ede5a457c0968"
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"
version = "1.3.0"

[[LibGit2]]
deps = ["Printf"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "291dd857901f94d683973cdf679984cdf73b56d0"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.1.0+2"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "86197a8ecb06e222d66797b0c2d2f0cc7b69e42b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "c253236b0ed414624b083e6b72bfe891fbd2c7af"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2021.1.1+1"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "5a5bc6bf062f0f95e62d0fe0a2d99699fed82dd9"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.8"

[[MappedArrays]]
git-tree-sha1 = "e8b359ef06ec72e8c030463fe02efe5527ee5142"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.1"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "b34e3bc3ca7c94914418637cb10cc4d1d80d877d"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.3"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[Netpbm]]
deps = ["ColorVectorSpace", "FileIO", "ImageCore"]
git-tree-sha1 = "09589171688f0039f13ebe0fdcc7288f50228b52"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.0.1"

[[OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "c870a0d713b51e4b49be6432eff0e26a4325afee"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.6"

[[OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "923319661e9a22712f24596ce81c54fc0366f304"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.1.1+0"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9db77584158d0ab52307f8c04f8e7c08ca76b5b3"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.3+4"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "e14c485f6beee0c7a8dcf6128bf70b85f1fe201e"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.3.9"

[[PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "646eed6f6a5d8df6708f15ea7e02a7a2c4fe4800"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.10"

[[Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "2276ac65f1e236e0a6ea70baff3f62ad4c625345"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.2"

[[Pkg]]
deps = ["Dates", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "UUIDs"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "a7a7e1a88853564e551e4eba8650f8c38df79b37"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.1.1"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "afadeba63d90ff223a6a48d2009434ecee2ec9e8"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.1"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[Ratios]]
deps = ["Requires"]
git-tree-sha1 = "7dff99fbc740e2f8228c6878e2aad6d7c2678098"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.1"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[Rotations]]
deps = ["LinearAlgebra", "StaticArrays", "Statistics"]
git-tree-sha1 = "2ed8d8a16d703f900168822d83699b8c3c1a5cd8"
uuid = "6038ab10-8711-5258-84ad-4b1120ba62dc"
version = "1.0.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "LogExpFunctions", "OpenSpecFun_jll"]
git-tree-sha1 = "a322a9493e49c5f3a10b50df3aedaf1cdb3244b7"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.6.1"

[[StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[Static]]
deps = ["IfElse"]
git-tree-sha1 = "a8f30abc7c64a39d389680b74e749cf33f872a70"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.3.3"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3240808c6d463ac46f1c1cd7638375cd22abbccb"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.12"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8cbbc098554648c84f79a463c9ff0fd277144b6c"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.10"

[[TOML]]
deps = ["Dates"]
git-tree-sha1 = "44aaac2d2aec4a850302f9aa69127c74f0c3787e"
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[Test]]
deps = ["Distributed", "InteractiveUtils", "Logging", "Random"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[TiffImages]]
deps = ["ColorTypes", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "OffsetArrays", "OrderedCollections", "PkgVersion", "ProgressMeter"]
git-tree-sha1 = "632a8d4dbbad6627a4d2d21b1c6ebcaeebb1e1ed"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.4.2"

[[TiledIteration]]
deps = ["OffsetArrays"]
git-tree-sha1 = "52c5f816857bfb3291c7d25420b1f4aca0a74d18"
uuid = "06e1c1a7-607b-532d-9fad-de7d9aa2abac"
version = "0.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "59e2ad8fd1591ea019a5259bd012d7aee15f995c"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.3"

[[Zlib_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "320228915c8debb12cb434c59057290f0834dbf6"
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.11+18"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "2c1332c54931e83f8f94d310fa447fd743e8d600"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.4.8+0"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "6abbc424248097d69c0c87ba50fcb0753f93e0ee"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.37+6"
"""

# ╔═╡ Cell order:
# ╠═d61afe24-df30-11eb-3a5c-37f756dfed94
# ╟─2c1ef457-723c-48cf-8449-3888df55094c
# ╟─77587301-f2d5-40f3-b460-8f74dbecb13f
# ╟─68c689cd-0ea9-4c25-a18d-aadca00fc75f
# ╠═4333a6f8-033e-4967-b8e6-61158448dfc0
# ╠═a9c2f5b9-9760-420a-9fd2-14301ae0b924
# ╟─d914431d-e4fa-4bf6-b91b-3c1dc64ceeed
# ╟─aa404537-2517-4bbd-9130-e9ace5e30679
# ╟─998904c0-3b4d-443a-be89-ed8e0e2506ee
# ╠═c51ebdd5-715c-4933-9449-373f05a7e116
# ╟─ba536770-f7ba-42bf-a65d-22df9e014583
# ╟─b322b496-70ec-4f54-9de8-55ca6be989eb
# ╠═159fbf51-71ec-41ce-a7c3-8d1e8ed6e1ee
# ╠═f487d112-89a8-4e0b-b172-7ca9a5e485a2
# ╟─7207f68f-bc73-4ae9-8a5d-536902b154b5
# ╟─dad220a9-f476-4940-9446-41dcdeeb3e29
# ╠═4507899e-590c-4463-ba50-e15ce2b7f0a1
# ╟─69a929b1-5ffe-4826-9828-dcaac2942564
# ╟─7f2de5e2-c151-4c6c-9090-878a30bec5c5
# ╠═84b67ef8-770d-4d2c-9213-39eccfb76055
# ╟─6fb8cc01-355d-48a9-b142-c7625dd4482f
# ╟─e5460dcb-966f-4e95-9867-1b7193635969
# ╠═ea841914-5346-4a1b-8610-c5b1fd117eab
# ╠═65080739-0552-473b-b85a-d5331e9a4707
# ╠═b69a9d0d-1a9f-4b0e-81dd-37ca6046dd8d
# ╟─538245ad-af10-48dd-b25a-43acb4197f06
# ╠═eeabbe5a-11b4-465e-9f12-756ae8effb04
# ╟─8bcfd536-2be2-4658-96c5-b11605616033
# ╠═85a602f4-b5ba-4332-9a4e-7e0be2bd7bbd
# ╟─f844ccbf-21ad-4d63-bb0c-9f324a46569f
# ╠═1c4613bb-651c-4ade-a233-23a802da2c02
# ╟─c95afab0-c51a-4799-8419-9ecda95f8d99
# ╠═0e228c0a-0792-45ed-94a5-0a5585245222
# ╠═55794efb-df8f-45ea-8b2c-417b15fbe556
# ╟─2bad98c1-5efe-4058-8a33-38ec39d36261
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
