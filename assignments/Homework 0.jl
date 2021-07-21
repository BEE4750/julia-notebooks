### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

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
!!! warning "Answer still missing!"
    `random_vect` is `missing`. Did you add your own code?
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
!!! warning "Answer still missing!"
    `mean` is `missing`. Did you add your own code?
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
!!! warning "Answer still missing!"
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

# ╔═╡ 8177c03a-fcdc-4323-af81-47d493bf22f4
md"""
## Problem 3: Manipulating Vectors and Matrices

"""

# ╔═╡ e5460dcb-966f-4e95-9867-1b7193635969
md"""
### Problem 2.1: 
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
let
	result = demean(random_vect)
	if !(result isa Number)
		md"""
!!! warning "Answer not a number"
    `demean` does not return a number.
		"""
	elseif abs(sum(result)/length(result)) < 0.01
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
# ╠═7207f68f-bc73-4ae9-8a5d-536902b154b5
# ╟─dad220a9-f476-4940-9446-41dcdeeb3e29
# ╠═4507899e-590c-4463-ba50-e15ce2b7f0a1
# ╟─69a929b1-5ffe-4826-9828-dcaac2942564
# ╟─7f2de5e2-c151-4c6c-9090-878a30bec5c5
# ╠═84b67ef8-770d-4d2c-9213-39eccfb76055
# ╠═6fb8cc01-355d-48a9-b142-c7625dd4482f
# ╟─8177c03a-fcdc-4323-af81-47d493bf22f4
# ╟─e5460dcb-966f-4e95-9867-1b7193635969
# ╠═ea841914-5346-4a1b-8610-c5b1fd117eab
# ╠═65080739-0552-473b-b85a-d5331e9a4707
# ╠═b69a9d0d-1a9f-4b0e-81dd-37ca6046dd8d
