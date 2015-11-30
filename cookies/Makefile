all: index.html

force:
	bikeshed -f spec ./index.src.html

index.html: index.src.html
	bikeshed -f spec ./index.src.html

FPWD:
	bikeshed -f spec --md-status=FPWD --md-date=2015-12-15 ./index.src.html ./published/FPWD.html 

publish:
	git push origin master master:gh-pages
