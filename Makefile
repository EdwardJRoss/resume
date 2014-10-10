all: Edward_Ross.pdf

Edward_Ross.pdf : Edward_Ross.ps
	ps2pdf Edward_Ross.ps

Edward_Ross.ps : Edward_Ross.dvi
	dvips Edward_Ross.dvi

Edward_Ross.dvi : Edward_Ross.tex
	tex Edward_Ross.tex

clean :
	rm Edward_Ross.ps Edward_Ross.pdf Edward_Ross.dvi
