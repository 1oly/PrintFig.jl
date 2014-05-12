using PyPlot, PrintFig

x = linspace(0,2pi,100);
fig = plt.figure();
plot(x,sin(x),color="red");
title("Test plot");
xlabel(L"x");
ylabel(L"$\sin(x)$");
printfig(fig)	# Saves to file "FIG1.tex"
printfig(fig,filename="test.tex") # Saves to file "test.tex"