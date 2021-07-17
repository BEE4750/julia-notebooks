### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

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

# ╔═╡ 61c5e9e3-33d0-4210-9dc7-ff5a97c263de
md"""
## Comments

Comments hide statements from the interpreter or compiler. It's a good idea to liberally comment your code so readers (including yourself!) know why your code is structured and written the way it is.

Single-line comments in Julia are preceded with a `#`. Multi-line comments are preceded with `#=` and ended with `=#`
"""

# ╔═╡ 8fefcdc4-baeb-4571-a02d-97a3dd8de846
# This is a single-line comment. Nothing is evaluated.

# ╔═╡ 369fd218-f089-4bc5-b902-d4f6b7f5acc0
#=
This is a mult-line comment.

We might want to really organize our thoughts on what a function is doing in this space. We can take as much room as we want, with as many paragraphs.
=#

3 + 5 # now that we've exited the multi-line comment, subsequent expressions are evauluated

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

# ╔═╡ fa649ac0-8c39-4079-95c4-3ecbd0126ccd
x

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
β₁ = 10 # The name of this variable was entered with \beta + TAB + \_1 + TAB

# ╔═╡ 732f6f38-834e-4d66-ae6f-c0b7986c74ea
md"""
However, try not to overwrite predefined names! For example, you might not want to use `π` as a variable name...
"""

# ╔═╡ 1f384ca2-6306-45db-a7fa-bb290c89e0b9
π

# ╔═╡ cc87950a-ad98-4cbb-9342-838cb88b9bb2
md"""
!!! tip "Overwriting predefined names"
	In the grand scheme of things, overwriting `π` is not a huge deal unless you want to do some trigonometry. However, there are more important predefined functions and variables that you may want to be aware of. Always check that a variable or function name is not predefined!
"""

# ╔═╡ df1d776a-a867-4987-80dc-3e224bd24a1f
md"""
## Data Types

Each datum (importantly, *not* the variable which is bound to it) has a [data type](https://docs.julialang.org/en/v1/manual/types/). 

!!! info "Variables and data"
	
	Strictly speaking, a variable points to a particular memory address, which holds the information associated with some datum or data. These pieces of memory can be used to store different data as the variable is overwritten. This can be restricted to varying degrees depending on the programming language. In a *statically typed* language like C, the compiler needs to allocate memory based on the data type, and so once a variable is initialized with a given type, this type cannot be changed, even if the data itself can be. In a *dynamically typed* language such as Python, the types associated with variables can be changed, which may mean the variable needs to be assigned to a different piece of memory. This is one reason why compiled (and usually statically-typed) languages are often faster than interpreted (and usually dynamically-typed) languaged.

Julia is a dynamically-typed language, which means that you do not need to specify the type of a variable when you define it, and you can change types mid-program. However, this does not work in Pluto, as Pluto tries to keep track of variables so it can update all cells in a notebook that refer to that variable when the variable changes upstream.

Julia types are similar to C types, in that they require not only the *type* of data (Int, Float, String, etc), but also the precision (which is related to the amount of memory allocated to the variable). Issues with precision won't be a big deal in this class, though they matter when you're concerned about performance vs. decimal accuracy of code.

You can identify the type of a variable or expression with the `typeof()` function.
"""

# ╔═╡ 761167f8-8960-43e6-b415-91da76d651a9
typeof("This is a string.")

# ╔═╡ 9f89f415-4935-4a52-9bdb-bb5f7ac99dcd
typeof(x)

# ╔═╡ 2d5f885c-9875-4bc4-a20e-f348fbe08229
md"""
While Julia is dynamically-typed, you can specify the type of a variable when it is declared. This can increase speed, but perhaps just as importantly, can make it easier to identify type errors when debugging.
"""

# ╔═╡ 5e10e97d-263b-4239-a436-dd8e5e68318b
typeof(9)

# ╔═╡ 04f166f2-866b-4166-8e68-98b9449c87c3
z::Int8 = 9

# ╔═╡ b4edf559-7f15-43f4-842d-824b4dde1f65
typeof(z)

# ╔═╡ 6c89818b-9fb3-4b41-a6e1-69a0391df67d
md"""
### Numeric types

A key distinction is between an integer type (or *Int*) and a floating-point number type (or *float*). Integers only hold whole numbers, while floating-point numbers correspond to numbers with fractional (or decimal) parts. For example, `9` is an integer, while `9.25` is a floating point number. The difference between the two has to do with the way the number is stored in memory. `9`, an integer, is handled differently in memory than `9.0`, which is a floating-point number, even though they're mathematically the same value.
"""

# ╔═╡ 7a58aeb7-cd35-499c-90c1-3bd7fdb72a45
typeof(9)

# ╔═╡ d82218e6-c814-42bc-9490-d4e9e6fd887e
typeof(9.25)

# ╔═╡ dac8155d-9e4a-410c-85f0-17308b9ec5e3
md"""
Sometimes certain function specifications will require you to use a Float variable instead of an Int. One way to force an Int variable to be a Float is to add a decimal point at the end of the integer.
"""

# ╔═╡ d2bc8b3f-493b-4c20-bb5f-edda5dbc6eec
typeof(9.)

# ╔═╡ da17bd13-b567-4961-8c18-351522fdc989
md"""
In Julia, floats can also refer to complex numbers.
"""

# ╔═╡ 94067ed3-79fa-4d8b-9ef8-2a83dbb3e073
typeof(5. + 1.1im) # im defines the imaginary part of the complex number

# ╔═╡ f64658f1-8485-45cd-97e3-e387a58c6bbe
typeof(sqrt(Complex(-4))) # we get an error if we try to take the square root of a negative number without telling Julia that it should be prepared to work with complex floats

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
b = true
	

# ╔═╡ f39afc6a-4fb8-4ba0-b8bb-698ab753b181
md"""
Numerical comparisons, such as `==`, `!=`, or `<', return a Bool.
"""

# ╔═╡ 0441fb51-14df-4f79-b1bd-741b2dbf736d
c = 9 > 11

# ╔═╡ acb18cfb-6e26-4de9-980b-e337f5bc535f
md"""
Bools are important for logical flows, such as if-then-else blocks or certain types of loops.
"""

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

Logical operations can be used on variables of type `Bool`. Typical operators are `&&` (and), `||` (or), and `!` (not).
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
!!! tip "Making orders of operations explicit"
	We didn't do this above, since Julia doesn't require it, but it's easier to understand these types of compound expressions if you use parentheses to signal the order of operations. This helps with debugging!
"""

# ╔═╡ 6859d214-8195-48e9-95e7-313755e4fa19
(3 < 4) || (8 == 12)

# ╔═╡ d274fd38-af4b-4e0a-85da-6d43cc04226b
md"""
## Data Structures

Data structures are containers which hold multiple values in a convenient fashion. Julia has several built-in data structures, and there are many extensions provided in additional packages.
"""

# ╔═╡ b422d477-0682-4ac7-bc6c-8326bb33ba3e
md"""
### Tuples

Tuples are collections of values. Julia will pay attention to the types of these values, but they can be mixed. Tuples are also *immutable*: their values cannot be changed once they are defined.

Tuples can be defined by just separating values with commas.
"""

# ╔═╡ e303cd2f-bdfe-4601-ae95-c5d23e581eb2
test_tuple = 4, 5, 6

# ╔═╡ cf2f3fd0-92f4-4175-82aa-010380ad1177
md"""
To access a value, use square brackets and the desired index.
"""

# ╔═╡ ebab8621-8dff-426e-a781-060defdb5ea5
md"""
!!! note "Julia indexing"
	Julia indexing starts at 1, not 0!
"""

# ╔═╡ da3107e8-9701-4214-a84b-965c3abd102b
test_tuple[1]

# ╔═╡ db06b624-2233-400d-8d31-0835735df0be
md"""
As mentioned above, tuples are immutable. What happens if we try to change the value of the first element of `test_tuple`?
"""

# ╔═╡ 8159b166-7076-4566-862e-056578903066
test_tuple[1] = 5

# ╔═╡ b1449ef9-0818-4263-85be-a12f67b22ea4
md"""
Tuples also do not have to hold the same types of values.
"""

# ╔═╡ 3cdee3b4-6ba4-4356-96cd-d8361bb9f89c
test_tuple_2 = 4, 5., 'h'

# ╔═╡ 4eaf0469-a7f4-4362-9cf0-f07e96867351
typeof(test_tuple_2)

# ╔═╡ f2a66441-5b65-48db-b14a-195b200a899e
md"""
Tuples can also be defined by enclosing the values in parentheses.
"""

# ╔═╡ f2057e1a-15de-4f8d-908e-f9d2688412d8
test_tuple_3 = (4, 5., 'h')

# ╔═╡ 8e49339f-0bc8-4930-b55f-287613c13b34
typeof(test_tuple_3)

# ╔═╡ 3959ad11-23c3-4795-8471-65b29643a2f8
md"""
### Arrays

Arrays also hold multiple values, which can be accessed based on their index position. Arrays are commonly defined using square brackets.
"""

# ╔═╡ c9c5109b-0e91-46c9-bbb2-492bc0486b06
test_array = [1, 4, 7, 8]

# ╔═╡ a0980c46-7844-4e0a-82c2-7b46412dd533
test_array[2]

# ╔═╡ 92b053ff-c92c-4ef9-bdaf-fe280c58b90e
md"""
Unlike tuples, arrays are mutable, and their contained values can be changed later.
"""

# ╔═╡ ed9b7d90-4771-44de-a811-f78a2accef85
test_array[1] = 6

# ╔═╡ 38b16076-50bd-4fa0-ac5d-aa25589aa61d
test_array

# ╔═╡ ea8beaa4-779b-4d74-bf73-0c34bc75aceb
md"""
Arrays also can hold multiple types. Unlike tuples, this causes the array to no longer care about types at all.
"""

# ╔═╡ fadcd093-2ae3-4268-8b23-d0c12496d05d
test_array_2 = [6, 5., 'h']

# ╔═╡ e336dc66-1eab-4f02-9881-259c22c92a30
typeof(test_array)

# ╔═╡ 37850993-cde9-4300-8253-a106acd3f67f
typeof(test_array_2)

# ╔═╡ f3bb47e6-f092-4f6d-9623-382f49dcb210
md"""
### Dictionaries

Instead of using integer indices based on position, dictionaries are indexed by keys. They are specified by passing key-value pairs to the `Dict()` method.
"""

# ╔═╡ defd917c-4cdd-4cbf-9b67-1d4a7b77dc20
test_dict = Dict("A"=>1, "B"=>2)

# ╔═╡ 9830ec09-a403-4bde-abd0-0e7f1d15ca5c
test_dict["B"]

# ╔═╡ d92ebe5b-1bab-4551-957b-17c0e0c7b2f7
md"""
## Functions

A function is an object which accepts a tuple of arguments and maps them to a return value. In Julia, functions are defined using the following syntax.
"""

# ╔═╡ 7ae2c996-8659-4d8c-a152-05df7e16b3c7
function my_function(x,y)
	# some stuff involving x and y
end

# ╔═╡ 06cf1e33-df61-4b8a-8858-c6e5e48fa29a
function my_actual_function(x, y)
	return x + y
end

# ╔═╡ 54cbcc47-4fc0-4669-9eed-a32896011ce1
my_actual_function(3, 5)

# ╔═╡ 380d2d34-46f3-4a6d-b3be-421e1a0d9c4e
md"""
!!! note "Do you need to "return" values?"
	Functions in Julia do not require explicit use of a `return` statement. They will return the last expression evaluated in their definition. However, it's good style to explicitly `return` function outputs. This improves readability and debugging, especially when functions can return multiple expressions based on logical control flows (if-then-else blocks).
"""

# ╔═╡ e329ae2f-4d34-4e21-9cad-d1d7a0a526e6
md"""
Functions in Julia are objects, and can be treated like other objects. They can be assigned to new variables or passed as arguments to other functions.
"""

# ╔═╡ e31ed3a4-6f19-4a13-9015-7877a95cdbac
g = my_actual_function

# ╔═╡ 32c25b91-c07f-4bd5-aeb1-618b4074b3f1
g(3, 5)

# ╔═╡ e0c707e9-3a3f-4550-a96f-f8d7f8ac3034
# this function takes in a function f and two values x and y
function function_of_functions(f, x, y)
	return f(x, y)
end

# ╔═╡ 48b742b3-d3fa-4c0d-9f48-bcd082588b68
function_of_functions(g, 3, 5)

# ╔═╡ d41b6712-b8ec-48dc-bda4-fbaa04899dcb
md"""
### Optional arguments

There are two extremes with regard to function parameters which do not always need to be changed. The first is to hard-code them into the function body, which has a clear downside: when you do want to change them, the function needs to be edited directly. The other extreme is to treat them as regular arguments, passing them every time the function is called. This has the downside of potentially creating bloated function calls, particularly when there is a standard default value that makes sense for most function evaluations.

Most modern languages, including Julia, allow an alternate solution, which is to make these arguments *optional*. This involves setting a default value, which is used unless the argument is explicitly defined in a function call.
"""

# ╔═╡ 8f56b12a-73f0-494a-8c88-92bed2c30b43
function setting_optional_arguments(x, y, c=0.5)
	return c * (x + y)
end

# ╔═╡ ea8dd689-367b-42fc-95bc-db3a5e92f835
md"""
If we want to stick with the fixed value $c=0.5$, all we have to do is call `setting_optional_arguments` with the `x` and `y` arguments.
"""

# ╔═╡ 0d41f103-fe98-4772-a74f-ffe6d93c0b0c
setting_optional_arguments(3, 5)

# ╔═╡ d5b56a3a-03b0-483e-82cc-51acc15cefe7
md"""
Otherwise, we can pass a new value for `c`.
"""

# ╔═╡ e31af3dc-f002-4ec2-a297-d1526ec77257
setting_optional_arguments(3, 5, 2)

# ╔═╡ 8425452e-3f74-4f9b-b37c-cf75dfe0b4fb
md"""
## Returning multiple values

You can return multiple values by separating them with a comma. This implicitly causes the function to return a tuple of values.
"""

# ╔═╡ 1f4ee34f-6c79-4fa0-b956-411713a2e2e7
function return_multiple_values(x, y)
	return x + y, x * y
end

# ╔═╡ 2afc55e3-af2a-4d5a-933a-2c6fb786cac3
return_multiple_values(3, 5)

# ╔═╡ 197e70a7-d2cf-4b39-9aff-5c33bbb5ebbf
md"""
These values can be unpacked into multiple variables.
"""

# ╔═╡ bb75925f-889a-4533-af87-a06adeebc99b
n, ν = return_multiple_values(3, 5)

# ╔═╡ c9655a8c-78c4-4124-9bfc-1e6cc48f65fc
n

# ╔═╡ 990ace6f-a297-4bbd-a052-7e7a503f66ed
ν

# ╔═╡ c2449070-7598-4c65-98b3-c5f4e4d1f5e8
md"""
### Returning nothing

Sometimes you don't want a function to return any values at all. For example, you might want a function that only prints a string to the console.
"""

# ╔═╡ 851e9b67-755c-48cb-94e3-9d2d9d023cf4
function print_some_string(x)
	println("x: $x")
	return nothing
end

# ╔═╡ bdc888a7-9ba8-4a91-9766-80c4bebbd5ee
print_some_string(42)

# ╔═╡ 6fae67cb-68ee-4ea6-bed2-21d3ac8e3e04
md"""
### Function signatures

You can specify the *signature* of a function by specifying the types of arguments and/or return value. This isn't necessary, but it can help with debugging. For example, suppose we did the following:
"""

# ╔═╡ 9103d300-7445-4938-869d-5de4df12a11e
function_of_functions(g, 3, "5")

# ╔═╡ 07721f61-58c2-4818-b196-783770abe0f2
md"""
This type of error can be hard to track down without clear commenting. Specifying the type expected by a function can help debug these types of errors.
"""

# ╔═╡ 305d0945-8e69-407e-a7a5-7f3a7f04c006
function new_function(f::Function, x::Int64, y::Int64)
	return f(x, y)
end

# ╔═╡ 3a7c34eb-13b1-4ad7-a158-a45d349f4737
new_function(g, 3, 5)

# ╔═╡ ad9f4e77-0cda-40a7-b557-1a4fd0b00cb1
new_function(g, 3, "5")

# ╔═╡ 454582f8-2f51-4cde-946d-7c393d408bef
md"""
Notice that the error message here points out that the second numeric argument failed to match the expected type. 
"""

# ╔═╡ bde046a0-15dd-43b6-a854-a0681c91d017
md"""
### Return types

We can also specify the expected output type of a function. This will cause the function to return the value as the specified type if possible, even if that isn't the "natural" result of the operation.
"""

# ╔═╡ 8db146d1-1e57-42cf-ae1c-e2e8e200a657
function yet_another_function(x, y)::Int64
	return x + y
end

# ╔═╡ 54b9bc21-0481-4603-ada8-6bce7585470d
typeof(yet_another_function(3, 5.))

# ╔═╡ adf2ff9c-d938-4fed-997e-49f2a07815b9
md"""
This will return an error if the result cannot be interpreted exactly as the specified type, which can be useful.
"""

# ╔═╡ cac3bb99-525b-4c21-b7e6-fa93d1c4cb09
yet_another_function(3, 2.5)

# ╔═╡ 218f8422-0e8a-4da2-981d-ddf1d0602d9a
md"""
## Printing Text Output

The `Text()` function returns its argument as a plain text string. Notice how this is different from evaluating a string!
"""

# ╔═╡ ad4da834-9985-4a3e-9609-189093451f6a
Text("I'm printing a string.")

# ╔═╡ ac90dd41-6ba8-4dc7-bd27-b04644d0b1e8
md"""
`Text()` is used in this notebook as it *returns* the string passed to it. To print directly to the console, use `println()`. Run the cell below, then look at the Julia console from which you started Pluto.
"""

# ╔═╡ a44b1918-9de1-489f-9cfd-8f69956c4a9e
println("I'm writing a string to the console.")

# ╔═╡ e6a5ae05-7f7c-41c2-89bb-3c61c5afa269
md"""
### Printing Variables In a String
What if we want to include the value of a variable inside of a string? We do this using *string interpolation*, using `$variablename` inside of the string.
"""

# ╔═╡ e04d7d8d-641b-41c2-8858-a3c1606b8cac
bar = 42

# ╔═╡ 58a979e9-708a-4d4d-8ae8-25e309d7e2f5
Text("Now I'm printing a variable: $bar")

# ╔═╡ f2482896-394e-4cb1-867e-a5d2972bafa2
md"""
## Control Flows

One of the tricky things about learning a new programming language can be getting used to the specifics of control flow syntax. These types of flows include conditional if-then-else statements or loops.
"""

# ╔═╡ dec2a677-d139-4fbf-a67c-a5a4094a044c
md"""
### Conditional Blocks

Conditional blocks allow different pieces of code to be evaluated depending on the value of a boolean expression or variable. For example, if we wanted to compute the absolute value of a number, rather than using `abs()`:
"""

# ╔═╡ 69adceb5-c810-4358-b5a3-7bbee2d19b62
function our_abs(x)
	if x >= 0
		return x
	else
		return -x
	end
end

# ╔═╡ 0d112ed3-65cd-441f-a229-67a6f057fef2
our_abs(4)

# ╔═╡ f0c40786-b389-47e3-be3d-e1cd80c1dbfa
our_abs(-4)

# ╔═╡ 93f49710-5c5d-4565-b87d-3898c299f418
md"""
To nest conditional statements, use `elseif`.
"""

# ╔═╡ 6ed9feaa-af4d-45f0-8a45-4eee8895c28f
function test_sign(x)
	if x > 0
		return Text("x is positive.")
	elseif x < 0
		return Text("x is negative.")
	else
		return Text("x is zero.")
	end
end

# ╔═╡ e6308b8b-9b11-46bb-b326-4de53c4a3b9d
test_sign(-5)

# ╔═╡ 6ff41b30-be18-45fd-847b-48926481bdbc
test_sign(0)

# ╔═╡ f95ba1cf-d378-41c5-87c6-79bd85612304
md"""
### Loops

Loops allow expressions to be evaluated repeatedly until they are terminated. The two main types of loops are `while` loops and `for` loops.
"""

# ╔═╡ 22a07aab-c644-4267-9be3-9a5d656485a0
md"""
#### While loops

`while` loops continue to evaluate an expression so long as a specified boolean condition is `true`. This is useful when you don't know how many iterations it will take for the desired goal to be reached.
"""

# ╔═╡ 8645e18f-bf42-4289-8c50-879f45fb2e99
function compute_factorial(x)
	factorial = 1
	while (x > 1)
		factorial *= x
		x -= 1
	end
	return factorial
end

# ╔═╡ d54e67fa-7708-4b01-b24c-eceaee66fa39
compute_factorial(5)

# ╔═╡ 5c8b24d3-709a-4451-9381-ab356b713d26
md"""
!!! warning
	While loops can easily turn into infinite loops if the condition is never meaningfully updated. Be careful, and look there if your programs are getting stuck.
"""

# ╔═╡ 2d8d97e4-263d-4a1c-aa8b-54c55e23bcb6
md"""
If the expression in a `while` loop is false when the loop is reached, the loop will never be evaluated.
"""

# ╔═╡ b2c378f0-0e75-451c-9947-0a9df49bc59d
md"""
#### For loops

`for` loops run for a finite number of iterations, based on some defined index variable.
"""

# ╔═╡ a427f21b-89d2-4d0d-beeb-0b7508b61ce7
# this function will add the integers from zero through x
function add_some_numbers(x)
	total_sum = 0 # initialize at zero since we're adding
	for i=1:x # the counter i is updated every iteration
		total_sum += i
	end
	return total_sum
end

# ╔═╡ 636fcf81-1933-4f9f-8a6a-cf2ce31b2ea0
add_some_numbers(4)

# ╔═╡ 42b81985-6472-4dde-9857-dd4292957dc3
md"""
`for` loops can also iterate over explicitly passed containers, rather than iterating over an incrementally-updated index sequence. Use the `in` keyword when defining the loop.
"""

# ╔═╡ 0c9ae329-e3a2-43e6-b993-fc81e5289187
# this function will add all of the values passed in a container
function add_passed_numbers(set)
	total_sum = 0
	for i in set # this is the syntax we use when we want i to correspond to different container values
		total_sum += i
	end
	return total_sum
end

# ╔═╡ f3721f7f-e933-4248-b9b9-ef2fb35758fe
add_passed_numbers([1, 3, 5])

# ╔═╡ 0db862d4-836c-4e43-b0a7-176df6d49911
md"""
## Linear algebra

Matrices are defined in Julia as 2d arrays. Unlike basic arrays, matrices need to contain the same data type so Julia knows what operations are allowed. When defining a matrix, use semicolons to separate rows. Row elements should not be separated by commas.
"""

# ╔═╡ 3cda8c9a-0765-4a9f-9e76-4dc78a6d4f1c
test_matrix = [1 2 3; 4 5 6]

# ╔═╡ 00b26d8b-c094-4113-bfd7-7d1ed0a4d60c
md"""
Vectors are treated as 1d matrices. 
"""

# ╔═╡ 036f6a84-1dac-453e-8be2-73e3ac11d76a
test_row_vector = [1 2 3]

# ╔═╡ 627f3b88-9405-48f5-87e6-c8bbe190e487
test_col_vector = [1; 2; 3]

# ╔═╡ 0da47777-276d-4cbe-adf7-a08d29064d2b
md"""
Many linear algebra operations on vectors and matrices can be loaded using the `LinearAlgebra` package.
"""

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
# ╟─b8922cbc-de96-11eb-0713-b96ba045d21a
# ╟─e250bbe8-5345-4031-9619-a7d46d939202
# ╟─61c5e9e3-33d0-4210-9dc7-ff5a97c263de
# ╠═8fefcdc4-baeb-4571-a02d-97a3dd8de846
# ╠═369fd218-f089-4bc5-b902-d4f6b7f5acc0
# ╟─a5175526-fab3-4f6e-9ed5-7d3eaabdc6b4
# ╠═5417beae-f1e8-436e-aec9-6e22cd43ccbd
# ╠═e069a639-1836-4ea7-8aa0-8f9d6eb655cb
# ╠═d715f978-0453-4326-ac7f-f8abfa324ec6
# ╟─6d1e265e-711e-415c-90c3-0544c67a2059
# ╠═7d7324f0-f421-4a90-be51-01232dbced94
# ╟─69baf580-2476-4ccc-992d-a9002202a02b
# ╠═15ab7b05-fce1-4d94-b27f-92f653b9c133
# ╠═fa649ac0-8c39-4079-95c4-3ecbd0126ccd
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
# ╠═9f89f415-4935-4a52-9bdb-bb5f7ac99dcd
# ╟─2d5f885c-9875-4bc4-a20e-f348fbe08229
# ╠═5e10e97d-263b-4239-a436-dd8e5e68318b
# ╠═04f166f2-866b-4166-8e68-98b9449c87c3
# ╠═b4edf559-7f15-43f4-842d-824b4dde1f65
# ╟─6c89818b-9fb3-4b41-a6e1-69a0391df67d
# ╠═7a58aeb7-cd35-499c-90c1-3bd7fdb72a45
# ╠═d82218e6-c814-42bc-9490-d4e9e6fd887e
# ╟─dac8155d-9e4a-410c-85f0-17308b9ec5e3
# ╠═d2bc8b3f-493b-4c20-bb5f-edda5dbc6eec
# ╟─da17bd13-b567-4961-8c18-351522fdc989
# ╠═94067ed3-79fa-4d8b-9ef8-2a83dbb3e073
# ╠═f64658f1-8485-45cd-97e3-e387a58c6bbe
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
# ╟─d274fd38-af4b-4e0a-85da-6d43cc04226b
# ╟─b422d477-0682-4ac7-bc6c-8326bb33ba3e
# ╠═e303cd2f-bdfe-4601-ae95-c5d23e581eb2
# ╟─cf2f3fd0-92f4-4175-82aa-010380ad1177
# ╟─ebab8621-8dff-426e-a781-060defdb5ea5
# ╠═da3107e8-9701-4214-a84b-965c3abd102b
# ╟─db06b624-2233-400d-8d31-0835735df0be
# ╠═8159b166-7076-4566-862e-056578903066
# ╟─b1449ef9-0818-4263-85be-a12f67b22ea4
# ╠═3cdee3b4-6ba4-4356-96cd-d8361bb9f89c
# ╠═4eaf0469-a7f4-4362-9cf0-f07e96867351
# ╟─f2a66441-5b65-48db-b14a-195b200a899e
# ╠═f2057e1a-15de-4f8d-908e-f9d2688412d8
# ╠═8e49339f-0bc8-4930-b55f-287613c13b34
# ╟─3959ad11-23c3-4795-8471-65b29643a2f8
# ╠═c9c5109b-0e91-46c9-bbb2-492bc0486b06
# ╠═a0980c46-7844-4e0a-82c2-7b46412dd533
# ╟─92b053ff-c92c-4ef9-bdaf-fe280c58b90e
# ╠═ed9b7d90-4771-44de-a811-f78a2accef85
# ╠═38b16076-50bd-4fa0-ac5d-aa25589aa61d
# ╟─ea8beaa4-779b-4d74-bf73-0c34bc75aceb
# ╠═fadcd093-2ae3-4268-8b23-d0c12496d05d
# ╠═e336dc66-1eab-4f02-9881-259c22c92a30
# ╠═37850993-cde9-4300-8253-a106acd3f67f
# ╟─f3bb47e6-f092-4f6d-9623-382f49dcb210
# ╠═defd917c-4cdd-4cbf-9b67-1d4a7b77dc20
# ╠═9830ec09-a403-4bde-abd0-0e7f1d15ca5c
# ╟─d92ebe5b-1bab-4551-957b-17c0e0c7b2f7
# ╠═7ae2c996-8659-4d8c-a152-05df7e16b3c7
# ╠═06cf1e33-df61-4b8a-8858-c6e5e48fa29a
# ╠═54cbcc47-4fc0-4669-9eed-a32896011ce1
# ╟─380d2d34-46f3-4a6d-b3be-421e1a0d9c4e
# ╟─e329ae2f-4d34-4e21-9cad-d1d7a0a526e6
# ╠═e31ed3a4-6f19-4a13-9015-7877a95cdbac
# ╠═32c25b91-c07f-4bd5-aeb1-618b4074b3f1
# ╠═e0c707e9-3a3f-4550-a96f-f8d7f8ac3034
# ╠═48b742b3-d3fa-4c0d-9f48-bcd082588b68
# ╟─d41b6712-b8ec-48dc-bda4-fbaa04899dcb
# ╠═8f56b12a-73f0-494a-8c88-92bed2c30b43
# ╟─ea8dd689-367b-42fc-95bc-db3a5e92f835
# ╠═0d41f103-fe98-4772-a74f-ffe6d93c0b0c
# ╟─d5b56a3a-03b0-483e-82cc-51acc15cefe7
# ╠═e31af3dc-f002-4ec2-a297-d1526ec77257
# ╟─8425452e-3f74-4f9b-b37c-cf75dfe0b4fb
# ╠═1f4ee34f-6c79-4fa0-b956-411713a2e2e7
# ╠═2afc55e3-af2a-4d5a-933a-2c6fb786cac3
# ╟─197e70a7-d2cf-4b39-9aff-5c33bbb5ebbf
# ╠═bb75925f-889a-4533-af87-a06adeebc99b
# ╠═c9655a8c-78c4-4124-9bfc-1e6cc48f65fc
# ╠═990ace6f-a297-4bbd-a052-7e7a503f66ed
# ╟─c2449070-7598-4c65-98b3-c5f4e4d1f5e8
# ╠═851e9b67-755c-48cb-94e3-9d2d9d023cf4
# ╠═bdc888a7-9ba8-4a91-9766-80c4bebbd5ee
# ╟─6fae67cb-68ee-4ea6-bed2-21d3ac8e3e04
# ╠═9103d300-7445-4938-869d-5de4df12a11e
# ╟─07721f61-58c2-4818-b196-783770abe0f2
# ╠═305d0945-8e69-407e-a7a5-7f3a7f04c006
# ╠═3a7c34eb-13b1-4ad7-a158-a45d349f4737
# ╠═ad9f4e77-0cda-40a7-b557-1a4fd0b00cb1
# ╟─454582f8-2f51-4cde-946d-7c393d408bef
# ╟─bde046a0-15dd-43b6-a854-a0681c91d017
# ╠═8db146d1-1e57-42cf-ae1c-e2e8e200a657
# ╠═54b9bc21-0481-4603-ada8-6bce7585470d
# ╟─adf2ff9c-d938-4fed-997e-49f2a07815b9
# ╠═cac3bb99-525b-4c21-b7e6-fa93d1c4cb09
# ╟─218f8422-0e8a-4da2-981d-ddf1d0602d9a
# ╠═ad4da834-9985-4a3e-9609-189093451f6a
# ╟─ac90dd41-6ba8-4dc7-bd27-b04644d0b1e8
# ╠═a44b1918-9de1-489f-9cfd-8f69956c4a9e
# ╟─e6a5ae05-7f7c-41c2-89bb-3c61c5afa269
# ╠═e04d7d8d-641b-41c2-8858-a3c1606b8cac
# ╠═58a979e9-708a-4d4d-8ae8-25e309d7e2f5
# ╟─f2482896-394e-4cb1-867e-a5d2972bafa2
# ╟─dec2a677-d139-4fbf-a67c-a5a4094a044c
# ╠═69adceb5-c810-4358-b5a3-7bbee2d19b62
# ╠═0d112ed3-65cd-441f-a229-67a6f057fef2
# ╠═f0c40786-b389-47e3-be3d-e1cd80c1dbfa
# ╟─93f49710-5c5d-4565-b87d-3898c299f418
# ╠═6ed9feaa-af4d-45f0-8a45-4eee8895c28f
# ╠═e6308b8b-9b11-46bb-b326-4de53c4a3b9d
# ╠═6ff41b30-be18-45fd-847b-48926481bdbc
# ╟─f95ba1cf-d378-41c5-87c6-79bd85612304
# ╟─22a07aab-c644-4267-9be3-9a5d656485a0
# ╠═8645e18f-bf42-4289-8c50-879f45fb2e99
# ╠═d54e67fa-7708-4b01-b24c-eceaee66fa39
# ╟─5c8b24d3-709a-4451-9381-ab356b713d26
# ╟─2d8d97e4-263d-4a1c-aa8b-54c55e23bcb6
# ╟─b2c378f0-0e75-451c-9947-0a9df49bc59d
# ╠═a427f21b-89d2-4d0d-beeb-0b7508b61ce7
# ╠═636fcf81-1933-4f9f-8a6a-cf2ce31b2ea0
# ╟─42b81985-6472-4dde-9857-dd4292957dc3
# ╠═0c9ae329-e3a2-43e6-b993-fc81e5289187
# ╠═f3721f7f-e933-4248-b9b9-ef2fb35758fe
# ╟─0db862d4-836c-4e43-b0a7-176df6d49911
# ╠═3cda8c9a-0765-4a9f-9e76-4dc78a6d4f1c
# ╟─00b26d8b-c094-4113-bfd7-7d1ed0a4d60c
# ╠═036f6a84-1dac-453e-8be2-73e3ac11d76a
# ╠═627f3b88-9405-48f5-87e6-c8bbe190e487
# ╟─0da47777-276d-4cbe-adf7-a08d29064d2b
# ╟─b3797a46-aeaf-45e5-9573-be2c73cd7a78
