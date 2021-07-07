### A Pluto.jl notebook ###
# v0.14.2

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

# ╔═╡ 69baf580-2476-4ccc-992d-a9002202a02b
md"""
## Variables

Variables are names which correspond to some type of object. These names are bound to objects (and hence their values) using the = operator.

!!! note "begin-end blocks"
	The code block below is contained between `begin` and `end` delimiters. This is required by Pluto to include multiple commands within a single cell, when this is preferable to using multiple cells. It is not a broader Julia requirement.
"""

# ╔═╡ 15ab7b05-fce1-4d94-b27f-92f653b9c133
begin
	x = 5
	x
end

# ╔═╡ dcf7136b-dcaf-4485-a3c0-2752b14ac1f0
md"""
Variables can be manipulated with standard arithmetic operators.
"""

# ╔═╡ 3df5b391-5037-4f89-8649-cdcd104c9ad6
4 + x

# ╔═╡ 1ec18e90-cabc-4563-9198-3ab726273d57
md"""
Another advantage of Julia is the ability to use Greek letters (or other Unicode characters) as variable names. For example, type `\` followed by the name of the Greek letter (*i.e.* `\alpha`) followed by TAB.
"""

# ╔═╡ a3d0f497-9cae-4bd6-b8ac-5c8b2bbf85be
α = 3

# ╔═╡ 8fd31e30-421c-49f4-9844-c1d2da8882d5
md"""
You can also include subscripts or superscripts in variable names using `\_` and `\^`, respectively, followed by TAB. If using a Greek letter followed by a sub- or super-script, make sure you TAB following the name of the letter before the sub- or super-script. Effectively, TAB after you finish typing the name of each `\character`.
"""

# ╔═╡ 388c4846-6f7c-4073-b963-767f4d75a437
β₁ = 10

# ╔═╡ 732f6f38-834e-4d66-ae6f-c0b7986c74ea
md"""
However, try not to overwrite predefined names! For example, you might not want to use `π` as a variable name...
"""

# ╔═╡ 1f384ca2-6306-45db-a7fa-bb290c89e0b9
π

# ╔═╡ cc87950a-ad98-4cbb-9342-838cb88b9bb2
md"""
In the grand scheme of things, overwriting `π` is not a huge deal unless you want to do some trigonometry. However, there are more important predefined functions and variables that you may want to be aware of. Always check that a variable or function name is not predefined!
"""

# ╔═╡ df1d776a-a867-4987-80dc-3e224bd24a1f
md"""
## Data Types

Each datum (importantly, *not* the variable which is bound to it) has a [data type](https://docs.julialang.org/en/v1/manual/types/). 

!!! info "Variables and data"
	
	Strictly speaking, a variable points to a particular memory address, which holds the information associated with some datum or data. These pieces of memory can be used to store different data as the variable is overwritten. This can be restricted to varying degrees depending on the programming language. In a *statically typed* language like C, the compiler needs to allocate memory based on the data type, and so once a variable is initialized with a given type, this type cannot be changed, even if the data itself can be. In a *dynamically typed* language such as Python, the types associated with variables can be changed, which may mean the variable needs to be assigned to a different piece of memory. This is one reason why compiled (and usually statically-typed) languages are often faster than interpreted (and usually dynamically-typed) languaged.

Julia is a dynamically-typed language, which means that you do not need to specify the type of a variable when you define it, and you can change types mid-program. However, this does not work in Pluto, as Pluto tries to keep track of variables so it can update all cells in a notebook that refer to that variable when the variable changes upstream.

While Julia is dynamically-typed, you can specify the type of a variable when it is declared. This can increase speed, but perhaps just as importantly, can make it easier to identify type errors when debugging.

Julia types are similar to C types, in that they require not only the *type* of data (Int, Float, String, etc), but also the precision (which is related to the amount of data allocated to the variable). You can identify the type of a variable or expression with the `typeof()` function.
"""

# ╔═╡ 761167f8-8960-43e6-b415-91da76d651a9
typeof("This is a string.")

# ╔═╡ 5e10e97d-263b-4239-a436-dd8e5e68318b
typeof(9)

# ╔═╡ 9f89f415-4935-4a52-9bdb-bb5f7ac99dcd
typeof(x)

# ╔═╡ bcbfd316-937e-4fc3-b798-677059460247
begin
	z::Int8 = 6
	typeof(z)
end

# ╔═╡ 6c89818b-9fb3-4b41-a6e1-69a0391df67d
md"""
### Numeric types

A key distinction is between an integer type (or *Int*) and a floating-point number type (or *float*). Integers only hold whole numbers, while floating-point numbers correspond to numbers with fractional (or decimal) parts. For example, `9` is an integer, while `9.25` is a floating point number. The difference between the two has to do with the way the number is stored in memory. `9`, an integer, is handled differently in memory than `9.0`, which is a floating-point number, even though they're mathematically the same value.

Sometimes certain function specifications will require you to use a Float variable instead of an Int. One way to force an Int variable to be a Float is to add a decimal point at the end of the integer.
"""

# ╔═╡ d2bc8b3f-493b-4c20-bb5f-edda5dbc6eec
typeof(9.)

# ╔═╡ ca004cf3-0496-41f8-b64f-b728e2169307
begin
	a = 9 / n
	typeof(a)
end

# ╔═╡ 260f132c-1375-4519-b96a-6a45b22f060b
md"""
### Strings

Strings hold characters, rather than numeric values. Even if a string contains what seems like a number, it is actually stored as the character representation of the digits. As a result, you cannot use arithmetic operators (for example) on this datum.
"""

# ╔═╡ 01a3e38a-2676-46fb-8c26-ab342babbcb5
"5" + 5

# ╔═╡ 4e9f5f04-99bf-451e-a3f2-8ec89720b028
md"""
However, you can try to tell Julia to interpret a string encoding a numeric character as a numeric value using the `parse()` function. This can also be used to encode a numeric data as a string.
"""

# ╔═╡ 71348bbf-79ca-4809-bdca-ab68313792c7
parse(Int64, "5") + 5

# ╔═╡ b7c3a595-7bb6-45ed-9c39-968a1eaa43df
md"""
Two strings can be concatenated using `*`:
"""

# ╔═╡ 14c6f2de-18ad-4884-b1d5-246830707593
"Hello" * " " * "there"

# ╔═╡ 78b9bd15-9022-4fd7-b230-bcc844d41f57
md"""
### Booleans

Boolean variables (or *Bools*) are logical variables, that can have `true` or `false` as values.
"""

# ╔═╡ 7cfc646c-83c7-462e-bd09-64acaba84218
begin
	b = true
	b
end

# ╔═╡ f39afc6a-4fb8-4ba0-b8bb-698ab753b181
md"""
Numerical comparisons, such as `==`, `!=`, or `<', return a Bool.
"""

# ╔═╡ 0441fb51-14df-4f79-b1bd-741b2dbf736d
begin
	c = 9 > 11
	c
end

# ╔═╡ acb18cfb-6e26-4de9-980b-e337f5bc535f
md"""
Bools are important for logical flows, such as if-then-else blocks or certain types of loops.
"""

# ╔═╡ 218f8422-0e8a-4da2-981d-ddf1d0602d9a
md"""
## Printing Text Output

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

# ╔═╡ 274d3790-51d8-45fa-8ce6-092e7eb2dbbf
md"""
## Mathematical operations

Addition, subtraction, multiplication, and division work as you would expect. Just pay attention to types! The type of the output is influenced by the type of the inputs: adding or multiplying an Int by a Float will always result in a Float, even if the Float is mathematically an integer. Division is a little special: dividing an Int by another Int will still return a float, because Julia doesn't know ahead of time if the denominator is a factor of the numerator.
"""

# ╔═╡ b2aa690e-5cfe-493a-9953-fb37e634559b
3 + 5

# ╔═╡ 75bbaedf-8c76-4ac9-a49f-3b33a3efadbb
3 * 2

# ╔═╡ c987a377-914d-43b3-a147-be09b7a453c4
3 * 2.

# ╔═╡ 24261165-1e6e-4347-963d-38e9b532b24b
6 - 2

# ╔═╡ 66906391-3324-48e6-b56a-daa73da8072d
9 / 3

# ╔═╡ c81974d8-0d45-43db-8a64-72789bda7a20
md"""
Raising a base to an exponent uses `^`, not `**`.
"""

# ╔═╡ 7a453b7a-176e-4b5d-88f3-c4fcfee80773
3^2

# ╔═╡ 42a3a62a-0c51-4dde-9c45-4ba4f21e4c9f
md"""
Julia allows the use of updating operators to simplify updating a variable in place (in other words, using `x += 5` instead of `x = x + 5`.
"""

# ╔═╡ a66caa4c-9023-4acf-a68d-903aba9dea2d
md"""
### Boolean algebra

Logical operations can be used on variables of type `Bool`.
"""

# ╔═╡ b5392073-c3fe-4839-9079-02abdcd4ff2d
true && true

# ╔═╡ 83fbcc5b-71cf-4a88-a795-516f3fbb0597
true && false

# ╔═╡ 7ef3fab7-fca3-4332-b7ce-075b3da75f86
true || false

# ╔═╡ 2ff4ca04-bab4-4bb4-a6b6-6a101a52b916
!true

# ╔═╡ 8104e522-7f79-4a5f-b510-df16c94c3f47
md"""
Comparisons can be chained together.
"""


# ╔═╡ 685d48e5-a579-43cc-9949-b40477e0f804
3 < 4 || 8 == 12

# ╔═╡ c7428de8-3446-41be-acc7-a9fae46e6365
md"""
We didn't do this above, since Julia doesn't require it, but it's easier to understand these types of compound expressions if you use parentheses to signal the order of operations. This helps with debugging!
"""

# ╔═╡ 6859d214-8195-48e9-95e7-313755e4fa19
(3 < 4) || (8 == 12)

# ╔═╡ b3797a46-aeaf-45e5-9573-be2c73cd7a78
md"""
## Package management

Sometimes you might need functionality that does not exist in base Julia. Julia handles packages using the [`Pkg` package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/). After finding a package which has the functions that you need, you have two options:

1. Use the package management prompt in the Julia REPL (the standard Julia interface; what you get when you type `julia` in your terminal). Enter this by typing `]` at the standard green Julia prompt `julia>`. This will become a blue `pkg>`. You can then download and install new packages using `add packagename`. 
2. From the standard prompt, enter `Pkg.add(packagename)`.

The `packagename` package can then be used by adding `using packagename` to the start of the script.

Pluto actually simplifies this! It will automatically download and install `packagename` when `using packagename` is run in a cell.
"""

# ╔═╡ Cell order:
# ╠═2ca040d9-9f67-4f35-9c9b-213969487997
# ╟─b8922cbc-de96-11eb-0713-b96ba045d21a
# ╟─e250bbe8-5345-4031-9619-a7d46d939202
# ╟─a5175526-fab3-4f6e-9ed5-7d3eaabdc6b4
# ╠═5417beae-f1e8-436e-aec9-6e22cd43ccbd
# ╠═e069a639-1836-4ea7-8aa0-8f9d6eb655cb
# ╠═d715f978-0453-4326-ac7f-f8abfa324ec6
# ╠═6d1e265e-711e-415c-90c3-0544c67a2059
# ╠═7d7324f0-f421-4a90-be51-01232dbced94
# ╠═69baf580-2476-4ccc-992d-a9002202a02b
# ╠═15ab7b05-fce1-4d94-b27f-92f653b9c133
# ╟─dcf7136b-dcaf-4485-a3c0-2752b14ac1f0
# ╠═3df5b391-5037-4f89-8649-cdcd104c9ad6
# ╟─1ec18e90-cabc-4563-9198-3ab726273d57
# ╠═a3d0f497-9cae-4bd6-b8ac-5c8b2bbf85be
# ╟─8fd31e30-421c-49f4-9844-c1d2da8882d5
# ╠═388c4846-6f7c-4073-b963-767f4d75a437
# ╟─732f6f38-834e-4d66-ae6f-c0b7986c74ea
# ╠═1f384ca2-6306-45db-a7fa-bb290c89e0b9
# ╟─cc87950a-ad98-4cbb-9342-838cb88b9bb2
# ╟─df1d776a-a867-4987-80dc-3e224bd24a1f
# ╠═761167f8-8960-43e6-b415-91da76d651a9
# ╠═5e10e97d-263b-4239-a436-dd8e5e68318b
# ╠═9f89f415-4935-4a52-9bdb-bb5f7ac99dcd
# ╠═bcbfd316-937e-4fc3-b798-677059460247
# ╟─6c89818b-9fb3-4b41-a6e1-69a0391df67d
# ╠═d2bc8b3f-493b-4c20-bb5f-edda5dbc6eec
# ╠═ca004cf3-0496-41f8-b64f-b728e2169307
# ╟─260f132c-1375-4519-b96a-6a45b22f060b
# ╠═01a3e38a-2676-46fb-8c26-ab342babbcb5
# ╟─4e9f5f04-99bf-451e-a3f2-8ec89720b028
# ╠═71348bbf-79ca-4809-bdca-ab68313792c7
# ╟─b7c3a595-7bb6-45ed-9c39-968a1eaa43df
# ╠═14c6f2de-18ad-4884-b1d5-246830707593
# ╟─78b9bd15-9022-4fd7-b230-bcc844d41f57
# ╠═7cfc646c-83c7-462e-bd09-64acaba84218
# ╟─f39afc6a-4fb8-4ba0-b8bb-698ab753b181
# ╠═0441fb51-14df-4f79-b1bd-741b2dbf736d
# ╟─acb18cfb-6e26-4de9-980b-e337f5bc535f
# ╟─218f8422-0e8a-4da2-981d-ddf1d0602d9a
# ╠═ad4da834-9985-4a3e-9609-189093451f6a
# ╟─e6a5ae05-7f7c-41c2-89bb-3c61c5afa269
# ╠═58a979e9-708a-4d4d-8ae8-25e309d7e2f5
# ╟─274d3790-51d8-45fa-8ce6-092e7eb2dbbf
# ╠═b2aa690e-5cfe-493a-9953-fb37e634559b
# ╠═75bbaedf-8c76-4ac9-a49f-3b33a3efadbb
# ╠═c987a377-914d-43b3-a147-be09b7a453c4
# ╠═24261165-1e6e-4347-963d-38e9b532b24b
# ╠═66906391-3324-48e6-b56a-daa73da8072d
# ╟─c81974d8-0d45-43db-8a64-72789bda7a20
# ╠═7a453b7a-176e-4b5d-88f3-c4fcfee80773
# ╟─42a3a62a-0c51-4dde-9c45-4ba4f21e4c9f
# ╟─a66caa4c-9023-4acf-a68d-903aba9dea2d
# ╠═b5392073-c3fe-4839-9079-02abdcd4ff2d
# ╠═83fbcc5b-71cf-4a88-a795-516f3fbb0597
# ╠═7ef3fab7-fca3-4332-b7ce-075b3da75f86
# ╠═2ff4ca04-bab4-4bb4-a6b6-6a101a52b916
# ╟─8104e522-7f79-4a5f-b510-df16c94c3f47
# ╠═685d48e5-a579-43cc-9949-b40477e0f804
# ╟─c7428de8-3446-41be-acc7-a9fae46e6365
# ╠═6859d214-8195-48e9-95e7-313755e4fa19
# ╟─b3797a46-aeaf-45e5-9573-be2c73cd7a78
