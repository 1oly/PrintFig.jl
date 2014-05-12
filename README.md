PrintFig.jl
========

Generate nice looking figures with [matplotlib2tikz](https://github.com/nschloe/matplotlib2tikz) in [julia](http://julialang.org) and export to LaTeX.

## Requirements and installation
The PrintFig.jl module requires [PyCall](https://github.com/stevengj/PyCall.jl) and [PyPlot](https://github.com/stevengj/PyPlot.jl). Get these with `Pkg.add("PyPlot.jl")` in julia. If used in conjunction with [IJulia](https://github.com/JuliaLang/IJulia.jl), there might be issues with the qt backend. Some reports suggest that installing pyqt helps. If the anaconda package is used, installing pyqt for anaconda worked for me:

```
conda install -c asmeurer pyqt
```

Add [matplotlib2tikz](https://github.com/nschloe/matplotlib2tikz) to the current directory or add its path to your `PYTHONPATH`, e.g.

```
ENV["PYTHONPATH"] = join([ENV["PYTHONPATH"],path/to/dir])
```

If this is added to the `.juliarc.jl` file, it is loaded at each startup. Or it can be added to `.bashrc`, `.profile` etc.


## Usage

Basic usage:

```
using PyPlot, PrintFig	 	# Add modules
fig = plt.figure();		 	# Create figure object
x = linspace(0,2pi,100);    
plot(x,sin(x),color="red"); # Create plot as usual with PyPlot
title("Test plot");			
xlabel(L"x");
ylabel(L"$\sin(x)$");
printfig(fig)				# Save figure object to current directory
```

This approach creates a  file `FIG1.tex` with documentclass `standalone` with the plot inside a tikzpicture:

```
\documentclass[tikz]{standalone}
\usepackage{pgfplots}
\pgfplotsset{compat=newest}
\usepackage{amsmath}
\usepackage{siunitx}
\begin{document}
\begin{tikzpicture}
...			# Axes and plot is defined
\end{tikzpicture}
\end{document}
```

And the document is compiled as a normal `.tex` file.

The figure can also be saved to a user defined directory by using the `filename` keyword: `printfig(fig,filename="path/to/dir/filename")`

