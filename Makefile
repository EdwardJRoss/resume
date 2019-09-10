all: Edward_Ross.pdf
doc: Edward_Ross.odt

Edward_Ross.md: Edward_Ross.tex
	python toPandoc.py > Edward_Ross.md

Edward_Ross.docx: Edward_Ross.md
	pandoc -s -f markdown+smart Edward_Ross.md -o Edward_Ross.docx

Edward_Ross.odt: Edward_Ross.md
	pandoc -s -f markdown+smart Edward_Ross.md -o Edward_Ross.odt

Edward_Ross.html: Edward_Ross.md
	pandoc -s -f markdown+smart --metadata pagetitle='Edward Ross' Edward_Ross.md -o Edward_Ross.html

Edward_Ross.pdf : Edward_Ross.ps
	ps2pdf Edward_Ross.ps

Edward_Ross.ps : Edward_Ross.dvi
	dvips Edward_Ross.dvi

Edward_Ross.dvi : Edward_Ross.tex
	tex Edward_Ross.tex

clean :
	rm Edward_Ross.ps Edward_Ross.pdf Edward_Ross.dvi Edward_Ross.log Edward_Ross.md Edward_Ross.docx Edward_Ross.html Edward_Ross.odt
