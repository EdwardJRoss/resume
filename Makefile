all: Edward_Ross.pdf
pdf: Edward_Ross.pdf
doc: Edward_Ross.odt
html: Edward_Ross.html

Edward_Ross.md: Edward_Ross.tex
	python3 toPandoc.py > Edward_Ross.md

Edward_Ross.docx: Edward_Ross.md
	pandoc -s -f markdown+smart Edward_Ross.md -o Edward_Ross.docx

Edward_Ross.odt: Edward_Ross.md
	pandoc -s -f markdown+smart Edward_Ross.md -o Edward_Ross.odt

Edward_Ross.html: Edward_Ross.md
	pandoc -s -f markdown+smart --metadata pagetitle='Edward Ross' Edward_Ross.md -o Edward_Ross.html

Edward_Ross.pdf : Edward_Ross.tex
	pdftex Edward_Ross.tex

clean :
	rm -f Edward_Ross.pdf Edward_Ross.log Edward_Ross.md Edward_Ross.docx Edward_Ross.html Edward_Ross.odt
