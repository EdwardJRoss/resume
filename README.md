# Edward Ross' Personal Resume

To build the pdf run `make`.
This requires an appropriate TeX package (such as `texlive`), some fonts, and ghostscript.

You can also run this via Docker if you don't want to manage installing dependencies

```
docker build -t resume .
docker run -it -v $(pwd):/home resume
```

You can provide different targets to both make and Docker:

* `all` (default) builds `Edward_Ross.pdf`
* `doc`  builds `Edward_Ross.odt` which can then be consumed by Microsoft Word and other word processors
* `html` builds `Edward_Ross.html`
* `clean` removes all generated files
