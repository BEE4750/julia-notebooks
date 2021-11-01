### A Pluto.jl notebook ###
# v0.16.4

using Markdown
using InteractiveUtils

# ╔═╡ 92ec2287-984c-446e-8666-f47f8fe976f5
begin
	using PlutoUI # install the PlutoUI package
	TableOfContents(title="Table of Contents") 
	# other options include "depth=xx", which will change the level of included headers (see below), "indent=true/false", which will indent subsequent levels to make it more visually appealing, and "aside=true/false", which will put the table of contents over to the side.
end

# ╔═╡ 2f8e6642-eee0-11eb-20af-a1e27e03125d
md"""
# Introduction to Pluto and Markdown

Pluto is a platform for Julia notebooks. Pluto uses both Julia cells (cells which include and run code) with Markdown cells (cells which include formatted text). For an introduction to Julia, see the [Introduction to Julia notebook](https://github.com/BEE4750/julia-notebooks/blob/main/tutorials/01%20-%20Introduction%20to%20Julia.jl).  This notebook will focus on introducing you to Markdown after introducing some Pluto basics.
"""

# ╔═╡ f5e164ba-b798-41cf-a725-1fd2dbb1db4f
md"""
## Using a Pluto Notebook

One important consideration is that Pluto expects any Julia cell to include one command, and would prefer commands be split up across multiple cells. This is not always ideal --- for example, when plotting, and possibly when specifying complex optimization functions. In this case, enclose multiple commands in a `begin`-`end` block:

```julia
begin
	command 1
	command 2
end
```

### Running A Cell

Pluto will try to evaluate all of its cells automatically when the notebook is opened. If you add a new cell or want to re-run an existing cell, click the little play (▶) button at the bottom-right of the cell or hit Shift+Enter. 

### Adding a New cell

You can see plus (+) buttons to the upper-left and lower-left of a cell when it is open or when you hover over it with the mouse. Clicking on one of these will add a new cell above or below the cell in question. This should not generally be necessary in this class.

### Deleting a Cell

In the upper-right corner of a cell is a little circle with an ellipsis (...) in it. Clicking on that will open a menu which lets you delete or disable a cell (so Pluto will not try to evaluate it). This should not be necessary in this class unless you accidentally added a new cell.

### Hiding a Cell

At the upper-left of a cell is a little eye logo. This might have a slash through it. If it does, that means that the cell is hidden. If it does not, you should be able to see and edit the cell. A hidden cell will still be evaluated, the code or underlying text is just hidden. If you're not sure how to replicate something from a notebook (and the cell was hidden), feel free to unhide and take a look!

### Switching a Cell Between Markdown and Julia

By default, a new cell will be opened as a Julia cell. Any Julia cell can be converted to a Markdown cell by typing CTRL+M. Make sure your text is between the quote marks at the top and the bottom (the top should also have an md next to it to tell Pluto that this is a Markdown cell).

### Installing Packages

Certain Julia packages can be installed automatically using Pluto's internal package manager. For these packages, you can just type `using packagename` and Pluto will download, install, and load the package automatically. If this throws an error and you know you have the package name right, it's possible that the package needs to be installed using the broader Julia `Pkg` package manager. To install packages this way, 
```julia
begin
	import Pkg
	Pkg.add(packagename or an array of package names)
	using packagename(s)
end
```

### Adding a Table of Contents

You may choose to add a table of contents to assigments or reports which you submit as a Pluto notebook. This can be done using the `PlutoUI` package. You can install the package and add the table of contents using the code in the cell below. The command will automatically parse the Markdown to get the appropriate headers.
"""

# ╔═╡ e561a8b0-e2eb-4c76-a1c0-c7bdf06795ce
md"""
Notice that it doesn't matter how late in the document this cell is included, it will all work perfectly once it's evaluated.
"""

# ╔═╡ d54fb07e-afdf-4736-a586-8b6985855823
md"""
## What is Markdown?

Markdown is a powerful system for marking up plain text to format it nicely. It also includes the ability to use LaTeX for mathematical formatting.

Markdown comes in a lot of different flavors. The particular commands that Pluto recognizes are those [supported by Julia](https://docs.julialang.org/en/v1/stdlib/Markdown/). For the sake of completeness, we will include some particularly useful Markdown commands here.
"""

# ╔═╡ b1306d3a-140d-41b9-b1f8-245485e6809d
md"""
### Headers

Markdown allows us to turn text into several levels of headers using one or more hashtags. These are mainly useful for visual organization and for creating Tables of Contents.

```md
# Heading One
## Heading Two
### Heading Three
#### Heading Four
##### Heading Five
###### Heading Six
```
"""

# ╔═╡ 257b673b-eeb9-4948-8224-80064c0d23c7
md"""
### Text Formatting

Italicize text by enclosing it in single asterixes, as in `*this will be italicized*`. Bold text by enclosing it in two asterixes: `**this will be bolded**`. Three asterixes will bold and italicize the text: `***this will be really emphasized***`.
 
Text can be made literal by enclosing it in backticks, `. This will prevent Markdown from parsing it (for example, this is how I formatted the commands in the paragraph above so the asterixes were visible). These literals should also be used for inline code (including the names of functions, packages, and commands) to distinguish it from surrounding text.
"""

# ╔═╡ 21b47e0c-3ff4-4f74-b21e-01a2ccbd70c0
md"""
### Paragraphs

Form a new paragraph by separating text with a blank line.

```md
This is paragraph 1.

Now I'm going to write more stuff and it will be in a different paragraph.
```
"""

# ╔═╡ f340394b-f10f-4b3c-b642-22f6984dfbda
md"""
### Links

If you want to link to a reference or a website, enclose the link text in square brackets (`[]`) and then the URL in parentheses (`()`).

```md
Here is a [link to Google](https://google.com).
```
"""

# ╔═╡ 0138f9d2-6274-4c1d-992f-1bfb8aa7048e
md"""
### Lists

Unordered lists are created by prefacing list items with asterixes (`*`) or another item marking (`+` or `-`).

Sublists are created by indenting and using a different bullet style.

```md
Here is an unordered list.
* Item one
* Item two
* Item three
* This is a sublist
	+ Subitem one
	+ Subitem two
```

Ordered lists are created by numbering the list items. The numbers can be followed by a `.` or a `)`. They can start from any numerical value and will enumerate accordingly.
```md
And here is an ordered list.
1. Item one
2. Item two
3. Item three.
```

One downside to Markdown is that there isn't much flexibility for how lists are numbered, especially if you have a nested list. You're stuck with Roman numerals (1., 2., 3., etc).
"""

# ╔═╡ 394a7f0b-2e42-43a2-b55b-a0c0831743b3
md"""
### LaTeX

One of the main tools you'll be using is the ability to format mathematics using LaTeX. Inline LaTeX commands should be enclosed using two backticks on each side. So to format something like ``W_{ij} = \alpha``, use:
```md
``W_{ij} = \alpha``.
```

If you want to write a block of math (rather than including an equation or symbol inline), start with three backticks followed by "math" and end with three backticks. This is really hard to format without it getting parsed, so I don't have an example (though one is provided [here](https://docs.julialang.org/en/v1/stdlib/Markdown/#Display-equations)), but look at any of the notebooks that have typeset math in them and make the cell visible. 

All basic LaTeX commands are supported. You can also use environments in math blocks, such as `equation` or `align`, just as you would normally.
"""

# ╔═╡ b39fa911-b835-49ed-a007-81e8b6d21bac
md"""
### Tables

Tables can be created using this basic syntax
```
| Column One | Column Two | Column Three |
|:---------- | ---------- |:------------:|
| Row `1`    | Column `2` |              |
| *Row* 2    | **Row** 2  | Column ``3`` |
```

The resulting table is:

| Column One | Column Two | Column Three |
|:---------- | ---------- |:------------:|
| Row `1`    | Column `2` |              |
| *Row* 2    | **Row** 2  | Column ``3`` |

The positioning of the colons by the sequence of dashes separating the column headers from the contents indicates how the column should be aligned. Putting the colon on the left, as in `:---`, says to left-align, as in Column One. Putting the colon on the right, as in `---:`, says to right-align (this is the default, so no colons will right-align, as in Column Two). Using colons on both the left and the right will center the column, as in Column Three.

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "81690084b6198a2e1da36fcfda16eeca9f9f24e4"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.1"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "c8abc88faa3f7a3950832ac5d6e690881590d6dc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "1.1.0"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "5f6c21241f0f655da3952fd60aa18477cf96c220"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─2f8e6642-eee0-11eb-20af-a1e27e03125d
# ╟─f5e164ba-b798-41cf-a725-1fd2dbb1db4f
# ╠═92ec2287-984c-446e-8666-f47f8fe976f5
# ╟─e561a8b0-e2eb-4c76-a1c0-c7bdf06795ce
# ╟─d54fb07e-afdf-4736-a586-8b6985855823
# ╟─b1306d3a-140d-41b9-b1f8-245485e6809d
# ╟─257b673b-eeb9-4948-8224-80064c0d23c7
# ╟─21b47e0c-3ff4-4f74-b21e-01a2ccbd70c0
# ╟─f340394b-f10f-4b3c-b642-22f6984dfbda
# ╟─0138f9d2-6274-4c1d-992f-1bfb8aa7048e
# ╟─394a7f0b-2e42-43a2-b55b-a0c0831743b3
# ╟─b39fa911-b835-49ed-a007-81e8b6d21bac
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
