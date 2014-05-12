module PrintFig

using PyCall, PyPlot
import PyCall: @pyimport
import PyPlot: pygui
@pyimport matplotlib2tikz

export printfig

if !PyPlot.isdisplayok()
	pygui(false)
end

function printfig(fig; filename::String = "FIG")
	if filename == "FIG"
		temp = 1;
    	file = join([filename string(temp) ".tex"])
    	while isfile(file)
        	temp += 1;
        	file = join([filename string(temp) ".tex"])
    	end
    	tikzfile = join([file[1:end-4] ".tikz"]);
	else
		file = filename;
		tikzfile = join([file[1:end-4] ".tikz"]);
	end
	matplotlib2tikz.save(tikzfile,fig);
    fin = open(tikzfile,"r");
    fout = open(file,"w");
    lines = readlines(fin);
    close(fin);
    rm(tikzfile);
    lines = ["\\documentclass[tikz]{standalone}\n";
    "\\usepackage{pgfplots}\n";
    "\\pgfplotsset{compat=newest}\n";
    "\\usepackage{amsmath}\n";
    "\\usepackage{siunitx}\n";
    "\\begin{document}\n";lines;"\n\\end{document}\n"];
    write(fout,lines)
    close(fout)
end

end