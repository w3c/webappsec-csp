all: index.html ./pinning/index.html

force:
	bikeshed -f spec ./index.src.html

index.html: index.src.html
	bikeshed -f spec ./index.src.html

pinning/index.html: pinning/index.src.html
	bikeshed -f spec ./pinning/index.src.html

publish:
	git push origin master master:gh-pages

