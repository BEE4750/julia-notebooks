# bee4750
Development of Julia notebooks and assignments for BEE 4750

## Pluto

The notebooks are developed using [Pluto](https://github.com/fonsp/Pluto.jl/wiki). They can be saved and run as regular Julia scripts, or the raw scripts can be imported into a Pluto server. There are several advantages to Pluto:

* Pluto notebooks are *reactive*: when changes are made to a cell, all cells which depend on that cell are updated.
* Pluto notebooks can be saved as regular `.jl` files and executed in a Julia IDE or at the Julia command prompt (called the REPL); there are no weird file formats or other dependencies.

## Installation (need to document this in class)

1. Install the most recent version of Julia from https://julialang.org/downloads. 
2. Test Julia by running `julia` in a terminal. Make sure the REPL starts, and execute something (like `1+1`).
3. Install `Pluto`. Open the Julia REPL.
  - Switch to package mode by typing `]` at the prompt. The prompt should change to a blue `pkg>` instead of the original green `julia>`.
  ```julia
  julia> ]
  
  (@v1.6) pkg>
  ```
  - Execute `add Pluto` to download and install the Pluto package.
  ```julia
  (@v1.6) pkg> add Pluto
  ```
4. You can now close the terminal, or you can hit CTRL+C to exit package mode and return to the standard `julia>` prompt.

## Running a notebook

1. Start Pluto in the Julia REPL:
  ```julia
  julia> using Pluto
  julia> Pluto.run()
  ```
2. Your browser might automatically open the notebook server's URL (something like `http://localhost:1234/`). If not, the URL will be printed in the REPL, so open it.
3. If you want to open a notebook from Github (or any other remote location), copy and paste the link into the `Open from file:` box. The easiest way to get this link is by navigating to the repository page (this one!), clicking on the desired folder (such as `tutorials`), right-clicking on the desired file, and copying the link.

   If you want to open a locally-hosted file (such as if you cloned the repository), enter the path to the file.
5. You can save a notebook locally using the `Save notebook:` prompt. Once this is done, notebooks are autosaved when run. The resulting `.jl` file can be shared with others and submitted to Canvas.
