PrintFig.jl
========

Generate nice looking figures with [matplotlib2tikz](https://github.com/nschloe/matplotlib2tikz) in [julia](http://julialang.org) and export to LaTeX.

## Requirements and installation
The PrintFig.jl module requires [PyCall](https://github.com/stevengj/PyCall.jl) and [PyPlot](https://github.com/stevengj/PyPlot.jl). Get these with `Pkg.add("PyPlot.jl")` in julia. If used in conjunction with [IJulia](https://github.com/JuliaLang/IJulia.jl), there might be issues with the qt backend. Some reports suggest that installing pyqt helps. If the anaconda package is used, installing pyqt for anaconda worked for me:

	`conda install -c asmeurer pyqt`

Add [matplotlib2tikz](https://github.com/nschloe/matplotlib2tikz) to the current directory or add its path to your `PYTHONPATH`, e.g.

	`ENV["PYTHONPATH"] = join([ENV["PYTHONPATH"],joinpath(homedir(),"julia_utils")])`

If this is added to the `.juliarc.jl` file, it is loaded at each startup. Or it can be added to `.bashrc`, `.profile` etc.



## Usage

