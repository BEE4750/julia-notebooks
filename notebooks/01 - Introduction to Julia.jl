### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 2ca040d9-9f67-4f35-9c9b-213969487997
# edit the code below to set your name and ID (your email without @cornell.edu)

student = (name = "Jazzy Doe", cornell_id = "jd999")

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running.
# scroll down the page to see what's up

# ╔═╡ b8922cbc-de96-11eb-0713-b96ba045d21a
md"""
# Notebook 0: Introduction to Julia

**Welcome to BEE 4750 (or 5750, if you're a graduate student)!** This course is an introduction to environmental systems analysis. We will learn how to apply mathematical modeling, optimization, and simulation to understand environmental systems and to analyze and evaluate alternatives for solid waste management and water and air pollution control.

We'll be using the *Julia* programming language in this course. If you know Matlab or Python, adjusting to Julia shouldn't be too bad! The purpose of this notebook is to familiarize yourself with the basics of Julia and some fundamental aspects of programming. You should go through this notebook after setting up and testing Julia.

!!! warning "To-do"
    We need to create the set-up content and ideally link to it here.
"""


# ╔═╡ e250bbe8-5345-4031-9619-a7d46d939202
md"""
## Getting Help

* Check out the official documentation for Julia: [https://docs.julialang.org/en/v1/](https://docs.julialang.org/en/v1/).
* [Stack Overflow](https://stackoverflow.com) is a commonly-used resource for programming assistance.
* At a code prompt or in the REPL, you can always type `?functionname` to get help.
* If you're running this notebook inside of Pluto, typing a `functionname` and opening the Live Docs panel at the bottom right will open the help file.
"""

# ╔═╡ b0d4e05c-9bd5-4405-b397-bab2e7e23f9e
md"""
## Variables

Variables are names which correspond to some type of object. These names are bound to objects (and hence their values) using the = operator.
"""

# ╔═╡ 2c2520a8-c02f-4085-8470-c23d93939e49
begin
	x = 5
	x
end

# ╔═╡ cc4dfb23-d3d4-4f9a-9011-19f83ac36dfb


# ╔═╡ a5175526-fab3-4f6e-9ed5-7d3eaabdc6b4
md"""
## Evaluating Expressions


When you enter an expression in a notebook cell, hit Shift + Enter or press the ▶ button on the bottom-right to evaluate the cell.
"""

# ╔═╡ 5417beae-f1e8-436e-aec9-6e22cd43ccbd
5

# ╔═╡ e069a639-1836-4ea7-8aa0-8f9d6eb655cb
7 + 8

# ╔═╡ d715f978-0453-4326-ac7f-f8abfa324ec6
"I've entered a string."

# ╔═╡ 6d1e265e-711e-415c-90c3-0544c67a2059
md"""
You can suppress output using a semi-colon (;).
"""

# ╔═╡ 7d7324f0-f421-4a90-be51-01232dbced94
4+8;

# ╔═╡ 218f8422-0e8a-4da2-981d-ddf1d0602d9a
md"""
### Printing Text Output

Use the `Text()` function to print some text. Notice how this is different from evaluating a string!
"""

# ╔═╡ ad4da834-9985-4a3e-9609-189093451f6a
Text("I'm printing a string.")

# ╔═╡ e6a5ae05-7f7c-41c2-89bb-3c61c5afa269
md"""
### Printing Variables In a String
What if we want to include the value of a variable inside of a string? We do this using *string interpolation*, using `$variablename` inside of the string.
"""

# ╔═╡ 58a979e9-708a-4d4d-8ae8-25e309d7e2f5
begin
	bar = 42
	Text("Now I'm printing a variable: $bar")
end

# ╔═╡ Cell order:
# ╠═2ca040d9-9f67-4f35-9c9b-213969487997
# ╠═b8922cbc-de96-11eb-0713-b96ba045d21a
# ╠═e250bbe8-5345-4031-9619-a7d46d939202
# ╟─b0d4e05c-9bd5-4405-b397-bab2e7e23f9e
# ╠═2c2520a8-c02f-4085-8470-c23d93939e49
# ╠═cc4dfb23-d3d4-4f9a-9011-19f83ac36dfb
# ╟─a5175526-fab3-4f6e-9ed5-7d3eaabdc6b4
# ╠═5417beae-f1e8-436e-aec9-6e22cd43ccbd
# ╠═e069a639-1836-4ea7-8aa0-8f9d6eb655cb
# ╠═d715f978-0453-4326-ac7f-f8abfa324ec6
# ╠═6d1e265e-711e-415c-90c3-0544c67a2059
# ╠═7d7324f0-f421-4a90-be51-01232dbced94
# ╠═218f8422-0e8a-4da2-981d-ddf1d0602d9a
# ╠═ad4da834-9985-4a3e-9609-189093451f6a
# ╠═e6a5ae05-7f7c-41c2-89bb-3c61c5afa269
# ╠═58a979e9-708a-4d4d-8ae8-25e309d7e2f5
