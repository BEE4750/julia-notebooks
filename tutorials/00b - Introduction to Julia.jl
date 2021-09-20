### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ f833f6a2-80f2-4003-aff9-babe562709d2
begin
	using PlutoUI
	TableOfContents(title="Table of Contents")
end

# ╔═╡ 0f382acb-065a-44f5-a648-0569293797ce
using Plots, GraphRecipes

# ╔═╡ b8922cbc-de96-11eb-0713-b96ba045d21a
md"""
# Introduction to Julia

**Welcome to BEE 4750 (or 5750, if you're a graduate student)!** This course is an introduction to environmental systems analysis. We will learn how to apply mathematical modeling, optimization, and simulation to understand environmental systems and to analyze and evaluate alternatives for solid waste management and water and air pollution control.

We'll be using the *Julia* programming language in this course. If you know Matlab or Python, adjusting to Julia shouldn't be too bad! The purpose of this notebook is to familiarize yourself with the basics of Julia and some fundamental aspects of programming. You should go through this notebook after setting up and testing Julia.
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

# ╔═╡ 7cc41416-fdf9-4968-9592-a5982db2c006
md"""
### Comprehensions

Creating a data structure with more than a handful of elements can be tedious to do by hand. If your desired array follows a certain pattern, you can create structures using a *comprehension*. Comprehensions iterate over some other data structure (such as an array) implicitly and populate the new data structure based on the specified instructions.
"""

# ╔═╡ a0037117-0ce9-4ae1-b455-46a8b6d8955b
[i^2 for i in 0:1:5]

# ╔═╡ d7ebf534-bf06-4d2d-a89e-433956ae2661
md"""
For dictionaries, make sure that you also specify the keys.
"""

# ╔═╡ 3df793c9-ce6c-4b94-9479-db28807c2efa
Dict(string(i) => i^2 for i in 0:1:5)

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

# ╔═╡ 67232a2c-511e-4d2a-a96e-793828266535
md"""
### Short and Anonymous Functions

In addition to the long form of the function definition shown above, simple functions can be specified in more compact forms when helpful.
"""

# ╔═╡ e74dc74f-132d-42b7-8237-6b88a5299030
# short form
h₁(x) = x^2 # make the subscript using \_1 + <TAB>

# ╔═╡ 735358c0-f3fc-494a-ad94-aec1226d7d55
h₁(4)

# ╔═╡ 3e2b97b1-38e8-47d8-9d1e-5dfd2b6c959e
# anonymous form
x->sin(x)

# ╔═╡ 991b5def-6bb2-4206-8912-132b8d435c28
(x->sin(x))(π/4)

# ╔═╡ 10d7c9bc-935a-47f9-9849-5e912580f725
md"""
### Mutating Functions

The convention in Julia is that functions should not modify (or *mutate*) their input data. The reason for this is to ensure that the data is preserved. Mutating functions are mainly appropriate for applications where performance needs to be optimized, and making a copy of the input data would be too memory-intensive.

If you do write a mutating function in Julia, the convention is to add a `!` to its name, like `my_mutating_function!(x)`.
"""

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

# ╔═╡ ad132189-4da9-4eb5-ac07-46e65d5ef57c
md"""
### Passing data structures as arguments

Instead of passing variables individually, it may make sense to pass a data structure, such as an array or a tuple, and then unpacking within the function definition. This is straightforward in long form: access the appropriate elements using their index.

In short or anonymous form, there is a trick which allows the use of readable variables within the function definition.
"""

# ╔═╡ 60046b51-6e52-44f3-bec7-acd21732e7d0
h₂((x,y)) = x*y # enclose the input arguments in parentheses to tell Julia to expect and unpack a tuple

# ╔═╡ 6048c6d2-298c-44a5-a13b-e5ed456dbbf8
h₂((2, 3)) # this works perfectly, as we passed in a tuple

# ╔═╡ 3f5d7421-f090-47dc-9f25-8ae214bee4ab
h₂(2, 3) # this gives an error, as h₂ expects a single tuple, not two different numeric values

# ╔═╡ ab742b9b-87a9-4933-aa6b-26c10c3e19f1
h₂([3, 10]) # this also works with arrays instead of tuples

# ╔═╡ 0fafa041-1617-452c-ad64-a90536276881
md"""
### Vectorized operations

Julia uses **dot syntax** to vectorize an operation and apply it *element-wise* across an array.

For example, to calculate the square root of 3:
"""

# ╔═╡ 597a511f-6db4-48dc-9f2c-8cc33d36c239
sqrt(3)

# ╔═╡ f11810f7-a1cb-4a88-8324-2372ec069ecb
md"""
To calculate the square roots of every integer between 1 and 5:
"""

# ╔═╡ 38cffa0d-c31f-4d51-b11c-7657a97a68df
sqrt.([1, 2, 3, 4, 5])

# ╔═╡ c8ed98cc-7342-4014-afbb-efbef80f7bc4
md"""
The same dot syntax is used for arithmetic operations over arrays, since these operations are really functions.
"""

# ╔═╡ a3b7bb67-ae07-45c4-b344-cb58955a5497
[1, 2, 3, 4] .* 2

# ╔═╡ 63fcdd1f-f7a2-4bf4-a961-ddfd81410d37
md"""
Vectorization can be faster and is more concise to write and read than applying the same function to multiple variables or objects explicitly, so take advantage!
"""

# ╔═╡ 8425452e-3f74-4f9b-b37c-cf75dfe0b4fb
md"""
### Returning multiple values

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

# ╔═╡ 63e53734-68f9-4896-bb23-d2ef4574d2c1
md"""
You can also specify matrices using spaces and newlines.
"""

# ╔═╡ e8a3ff88-2fee-463b-936d-9fdd16a23d5b
test_matrix_2 = [1 2 3
				 4 5 6]

# ╔═╡ 7feaa210-2bd4-40cd-ab11-9730890dc1ad
md"""
Finally, matrices can be created using comprehensions by separating the inputs by a comma.
"""

# ╔═╡ 7041e3df-957c-42ff-85e4-a48ab6bd5531
[i*j for i in 1:1:5, j in 1:1:5]

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
2. From the standard prompt, enter `using Pkg; Pkg.add(packagename)`.

The `packagename` package can then be used by adding `using packagename` to the start of the script.

Pluto actually simplifies this! It will automatically download and install `packagename` when `using packagename` is run in a cell.
"""

# ╔═╡ 77fc55cd-fa30-4806-aea0-5c6daa8d6b77
md"""
## Making Plots

The main plotting package in Julia is [`Plots`](http://docs.juliaplots.org/latest/). There are lots of example of various plots out there, so we won't hash things in too much detail, but plotting networks will be useful for this class. We do this using the `graphplots()` function, which requires the `GraphRecipes` package in conjunction with `Plots`. `graphplots` is pretty smart: it will automatically detect how many nodes you want, whether the network is directed or undirected (do the edges have arrows?), and try to come up with a smart default layout (this can be overruled, as you will see below).

"""

# ╔═╡ 332dfe19-4c6f-4f94-a8a0-73820f9b1f02
md"""
To plot a network, you need an adjacency matrix for the underlying network graph (in other words, how are the nodes connected?). This is an n x n matrix which has a 1 in entry ``(i, j)`` (remember, row numbers come first) if node ``i`` is connected to node ``j``. Based on this matrix, `graphplots` will determine how many nodes you need. If the adjacency matrix is symmetric, it will make the network graph undirected, and it will be directed if the matrix is assymmetric.

For example, we might want to plot a simple 3-node network where node 1 is connected to node 3, node 2 is connected to nodes 1 and 3, and node 3 is connected to node 2 (self-edges are also fine).
"""

# ╔═╡ 76350574-bbdf-41e8-a8cc-39cb20003c0e
A = [0 0 1;
	 1 0 1;
	 0 1 0]

# ╔═╡ 5c8b1da1-05bf-4f69-acb6-f3259d295d33
graphplot(A) # this could take a while the first time you run it

# ╔═╡ 7fb66d08-913c-4d59-b56c-fd6ed22a7757
md"""
If we wanted to label the nodes, we pass an array of names.
"""

# ╔═╡ 787d262e-cfe3-4a2c-9806-84ffbe9dbfea
graphplot(A, names=["1", "2", "3"])

# ╔═╡ 37ec0b56-f145-42e5-b620-9bc9ae2e4d43
md"""
To add edge labels, create a dictionary where the keys are `(start, end)` and the values are the string label.
"""

# ╔═╡ 3eece8be-5470-495b-b0c8-39eb4e4e1201
edge_labels = Dict((1, 3) => "edge from 1 to 3", (2, 1) => "edge from 2 to 1", (3, 2) => "edge from 3 to 2")

# ╔═╡ e36fa76b-21b5-4cb8-a942-ab259c4f0e78
graphplot(A, names=["1", "2", "3"], edgelabel=edge_labels)

# ╔═╡ febf1d36-2a62-4ce2-841f-36c7ef2d11da
md"""
The label positions may need some tweaking using the `edgelabel_offset` parameter.
"""

# ╔═╡ ffe38005-483c-41a6-9028-008aa70cb4fc
md"""
We might also want to reposition the nodes. This can be done by creating arrays of x and y positions, or an array with tuples containing the (x,y) coordinates.
"""

# ╔═╡ c2847414-5b5d-4e70-96ad-23aecf9bc1c8
xpos = [-1, 0, 1]

# ╔═╡ ab973334-4074-4b32-82cb-90099734ca13
ypos = [1, -1, 1]

# ╔═╡ 17fc3811-7e71-45d9-a291-f1ba39ac0bb1
graphplot(A, names=["1", "2", "3"], edgelabel=edge_labels, x=xpos, y=ypos)

# ╔═╡ b88788b1-bd3f-4d53-a63a-371f272629ed
md"""
For a last demonstration, we can also then change the size of the nodes.
"""

# ╔═╡ 11ce6b28-8e5a-400c-b7e1-299541333cbd
graphplot(A, names=["1", "2", "3"], edgelabel=edge_labels, x=xpos, y=ypos, markersize=0.5)

# ╔═╡ 2785801a-a00c-459e-be03-dec299b50e99
md"""
Some additional examples and documentation are [here](https://docs.juliaplots.org/latest/graphrecipes/examples/).
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
GraphRecipes = "bd48cda9-67a9-57be-86fa-5b3c104eda73"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
GraphRecipes = "~0.5.5"
Plots = "~1.19.3"
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractTrees]]
git-tree-sha1 = "03e0550477d86222521d254b741d470ba17ea0b5"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.3.4"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "f87e559f87a45bece9c9ed97458d3afe98b1ebb9"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.1.0"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "a4d07a1c313392a77042855df46c5f534076fab9"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.0"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c3598e525718abcc440f69cc6d5f60dda0a1b61e"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.6+5"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "e2f47f6d8337369411569fd45ae5753ca10394c6"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.0+6"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "bdc0937269321858ab2a4f288486cb258b9a0af7"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.3.0"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "9995eb3977fbf67b86d0a0a0508e83017ded03f2"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.14.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "32a2b8af383f11cbb65803883837a149d10dfe8a"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.10.12"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "727e463cfebd0c7b999bbf3e9e7e16f254b94193"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.34.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[DataAPI]]
git-tree-sha1 = "ee400abb2298bd13bfc3df1c412ed228061a2385"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.7.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "92d8f9f208637e8d2d28c664051a00569c01493d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.1.5+1"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "LibVPX_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "3cc57ad0a213808473eafef4845a74766242e05f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.3.1+4"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "35895cf184ceaab11fd778b4590144034a167a2f"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.1+14"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "cbd58c9deb1d304f5a245a0b7eb841a2560cfec6"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.1+5"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "dba1e8614e98949abfa60480b13653813d8f0157"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+0"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "182da592436e287758ded5be6e32c406de3a2e47"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.58.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "d59e8320c2747553788e4fc42231489cc602fa50"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.58.1+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "15ff9a14b9e1218958d3530cc288cf31465d9ae2"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.3.13"

[[GeometryTypes]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "07194161fe4e181c6bf51ef2e329ec4e7d050fc4"
uuid = "4d00f742-c7ba-57c2-abde-4428a4b178cb"
version = "0.8.4"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "7bf67e9a481712b3dbe9cb3dac852dc4b1162e02"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+0"

[[GraphRecipes]]
deps = ["AbstractTrees", "GeometryTypes", "InteractiveUtils", "Interpolations", "LightGraphs", "LinearAlgebra", "NaNMath", "NetworkLayout", "PlotUtils", "RecipesBase", "SparseArrays", "Statistics"]
git-tree-sha1 = "7269dc06b8cd8d16fc2b1756cf7f41901bbc3c52"
uuid = "bd48cda9-67a9-57be-86fa-5b3c104eda73"
version = "0.5.7"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "60ed5f1643927479f845b0135bb369b031b541fa"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.14"

[[Inflate]]
git-tree-sha1 = "f5fc07d4e706b84f72d54eedcc1c13d92fb0871c"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.2"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[Interpolations]]
deps = ["AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "61aa005707ea2cebf47c8d780da8dc9bc4e0c512"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.13.4"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a4b12a1bd2ebade87891ab7e36fdbce582301a92"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.6"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[LibVPX_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "12ee7e23fa4d18361e7c2cde8f8337d4c3101bc7"
uuid = "dd192d2f-8180-539f-9fb4-cc70b1dcf69a"
version = "1.10.0+0"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "761a393aeccd6aa92ec3515e428c26bf99575b3b"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+0"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LightGraphs]]
deps = ["ArnoldiMethod", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "432428df5f360964040ed60418dd5601ecd240b6"
uuid = "093fc24a-ae57-5d10-9952-331d41423f4d"
version = "1.3.5"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "0fb723cd8c45858c22169b2e42269e53271a6df7"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.7"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "2ca267b08821e86c5ef4376cffed98a46c2cb205"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkLayout]]
deps = ["GeometryBasics", "LinearAlgebra", "Random", "Requires", "SparseArrays"]
git-tree-sha1 = "76bbbe01d2e582213e656688e63707d94aaadd15"
uuid = "46757867-2c16-5918-afeb-47bfcb05e46a"
version = "0.4.0"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "c870a0d713b51e4b49be6432eff0e26a4325afee"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.6"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "9ff1c70190c1c30aebca35dc489f7411b256cd23"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.13"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "1e72752052a3893d0f7103fbac728b60b934f5a5"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.19.4"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Ratios]]
deps = ["Requires"]
git-tree-sha1 = "7dff99fbc740e2f8228c6878e2aad6d7c2678098"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.1"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "1f27772b89958deed68d2709e5f08a5e5f59a5af"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.3.7"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

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

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "1700b86ad59348c0f9f68ddc95117071f947072d"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.1"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "d0c690d37c73aeb5ca063056283fde5585a41710"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

[[WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "59e2ad8fd1591ea019a5259bd012d7aee15f995c"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.3"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "acc685bcf777b2202a904cdcb49ad34c2fa1880c"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.14.0+4"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7a5780a0d9c6864184b3a2eeeb833a0c871f00ab"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "0.1.6+4"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d713c1ce4deac133e3334ee12f4adff07f81778f"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2020.7.14+2"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "487da2f8f2f0c8ee0e83f39d13037d6bbf0a45ab"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.0.0+3"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─f833f6a2-80f2-4003-aff9-babe562709d2
# ╠═b8922cbc-de96-11eb-0713-b96ba045d21a
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
# ╟─7cc41416-fdf9-4968-9592-a5982db2c006
# ╠═a0037117-0ce9-4ae1-b455-46a8b6d8955b
# ╟─d7ebf534-bf06-4d2d-a89e-433956ae2661
# ╠═3df793c9-ce6c-4b94-9479-db28807c2efa
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
# ╟─67232a2c-511e-4d2a-a96e-793828266535
# ╠═e74dc74f-132d-42b7-8237-6b88a5299030
# ╠═735358c0-f3fc-494a-ad94-aec1226d7d55
# ╠═3e2b97b1-38e8-47d8-9d1e-5dfd2b6c959e
# ╠═991b5def-6bb2-4206-8912-132b8d435c28
# ╟─10d7c9bc-935a-47f9-9849-5e912580f725
# ╟─d41b6712-b8ec-48dc-bda4-fbaa04899dcb
# ╠═8f56b12a-73f0-494a-8c88-92bed2c30b43
# ╟─ea8dd689-367b-42fc-95bc-db3a5e92f835
# ╠═0d41f103-fe98-4772-a74f-ffe6d93c0b0c
# ╟─d5b56a3a-03b0-483e-82cc-51acc15cefe7
# ╠═e31af3dc-f002-4ec2-a297-d1526ec77257
# ╟─ad132189-4da9-4eb5-ac07-46e65d5ef57c
# ╠═60046b51-6e52-44f3-bec7-acd21732e7d0
# ╠═6048c6d2-298c-44a5-a13b-e5ed456dbbf8
# ╠═3f5d7421-f090-47dc-9f25-8ae214bee4ab
# ╠═ab742b9b-87a9-4933-aa6b-26c10c3e19f1
# ╟─0fafa041-1617-452c-ad64-a90536276881
# ╠═597a511f-6db4-48dc-9f2c-8cc33d36c239
# ╟─f11810f7-a1cb-4a88-8324-2372ec069ecb
# ╠═38cffa0d-c31f-4d51-b11c-7657a97a68df
# ╟─c8ed98cc-7342-4014-afbb-efbef80f7bc4
# ╠═a3b7bb67-ae07-45c4-b344-cb58955a5497
# ╟─63fcdd1f-f7a2-4bf4-a961-ddfd81410d37
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
# ╠═5c8b24d3-709a-4451-9381-ab356b713d26
# ╟─2d8d97e4-263d-4a1c-aa8b-54c55e23bcb6
# ╟─b2c378f0-0e75-451c-9947-0a9df49bc59d
# ╠═a427f21b-89d2-4d0d-beeb-0b7508b61ce7
# ╠═636fcf81-1933-4f9f-8a6a-cf2ce31b2ea0
# ╟─42b81985-6472-4dde-9857-dd4292957dc3
# ╠═0c9ae329-e3a2-43e6-b993-fc81e5289187
# ╠═f3721f7f-e933-4248-b9b9-ef2fb35758fe
# ╟─0db862d4-836c-4e43-b0a7-176df6d49911
# ╠═3cda8c9a-0765-4a9f-9e76-4dc78a6d4f1c
# ╟─63e53734-68f9-4896-bb23-d2ef4574d2c1
# ╠═e8a3ff88-2fee-463b-936d-9fdd16a23d5b
# ╟─7feaa210-2bd4-40cd-ab11-9730890dc1ad
# ╠═7041e3df-957c-42ff-85e4-a48ab6bd5531
# ╟─00b26d8b-c094-4113-bfd7-7d1ed0a4d60c
# ╠═036f6a84-1dac-453e-8be2-73e3ac11d76a
# ╠═627f3b88-9405-48f5-87e6-c8bbe190e487
# ╟─0da47777-276d-4cbe-adf7-a08d29064d2b
# ╟─b3797a46-aeaf-45e5-9573-be2c73cd7a78
# ╟─77fc55cd-fa30-4806-aea0-5c6daa8d6b77
# ╠═0f382acb-065a-44f5-a648-0569293797ce
# ╟─332dfe19-4c6f-4f94-a8a0-73820f9b1f02
# ╠═76350574-bbdf-41e8-a8cc-39cb20003c0e
# ╠═5c8b1da1-05bf-4f69-acb6-f3259d295d33
# ╟─7fb66d08-913c-4d59-b56c-fd6ed22a7757
# ╠═787d262e-cfe3-4a2c-9806-84ffbe9dbfea
# ╟─37ec0b56-f145-42e5-b620-9bc9ae2e4d43
# ╠═3eece8be-5470-495b-b0c8-39eb4e4e1201
# ╠═e36fa76b-21b5-4cb8-a942-ab259c4f0e78
# ╟─febf1d36-2a62-4ce2-841f-36c7ef2d11da
# ╟─ffe38005-483c-41a6-9028-008aa70cb4fc
# ╠═c2847414-5b5d-4e70-96ad-23aecf9bc1c8
# ╠═ab973334-4074-4b32-82cb-90099734ca13
# ╠═17fc3811-7e71-45d9-a291-f1ba39ac0bb1
# ╟─b88788b1-bd3f-4d53-a63a-371f272629ed
# ╠═11ce6b28-8e5a-400c-b7e1-299541333cbd
# ╟─2785801a-a00c-459e-be03-dec299b50e99
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
