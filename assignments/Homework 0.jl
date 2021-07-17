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
## Problem 2: Working with the Mean of a Vector
"""

# ╔═╡ 998904c0-3b4d-443a-be89-ed8e0e2506ee
md"""
### Problem 2.1

Create a random vector `random_vect` of length 10 using the `rand` function.
"""

# ╔═╡ c51ebdd5-715c-4933-9449-373f05a7e116
random_vect = missing # replace this with your code

# ╔═╡ b322b496-70ec-4f54-9de8-55ca6be989eb
md"""
Make a function `for_mean` which computes the arithmetic mean of a vector of numbers using a `for` loop.
"""

# ╔═╡ 159fbf51-71ec-41ce-a7c3-8d1e8ed6e1ee
function for_mean(vect)
	return missing
end

# ╔═╡ f487d112-89a8-4e0b-b172-7ca9a5e485a2
for_mean(random_vect)

# ╔═╡ 7207f68f-bc73-4ae9-8a5d-536902b154b5
let
	result = for_mean(random_vect)
	if !(result isa Number)
		md"""
!!! warning "Answer not a number"
    `for_mean` does not return a number.
		"""
	elseif abs(result - sum(random_vect)/length(random_vect)) < 0.01
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
		

# ╔═╡ dad220a9-f476-4940-9446-41dcdeeb3e29
md"""
### Problem 2.2

Write a function `demean` which takes a vector `vect` and subtracts the mean from each value in `vect`.
"""

# ╔═╡ 4507899e-590c-4463-ba50-e15ce2b7f0a1
function demean(vect)
	return missing
end

# ╔═╡ 6fb8cc01-355d-48a9-b142-c7625dd4482f
demean(random_vect)

# ╔═╡ 7a3ad843-2aec-4247-b74d-3dd26cc0bf6e
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
		

# ╔═╡ 8177c03a-fcdc-4323-af81-47d493bf22f4


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
# ╟─b322b496-70ec-4f54-9de8-55ca6be989eb
# ╠═159fbf51-71ec-41ce-a7c3-8d1e8ed6e1ee
# ╠═f487d112-89a8-4e0b-b172-7ca9a5e485a2
# ╟─7207f68f-bc73-4ae9-8a5d-536902b154b5
# ╟─dad220a9-f476-4940-9446-41dcdeeb3e29
# ╠═4507899e-590c-4463-ba50-e15ce2b7f0a1
# ╠═6fb8cc01-355d-48a9-b142-c7625dd4482f
# ╟─7a3ad843-2aec-4247-b74d-3dd26cc0bf6e
# ╠═8177c03a-fcdc-4323-af81-47d493bf22f4
