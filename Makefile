all: index.html ./api/index.html ./cookies/index.html ./pinning/index.html

force:
	bikeshed -f spec ./index.src.html
	bikeshed -f spec ./api/index.src.html
	bikeshed -f spec ./cookies/index.src.html
	bikeshed -f spec ./pinning/index.src.html

index.html: index.src.html
	bikeshed -f spec ./index.src.html

FPWD:
	bikeshed -f spec --md-status=FPWD --md-date=2015-01-19 ./index.src.html ./published/FPWD-2015-01.html

WD:
	bikeshed -f spec --md-status=WD ./index.src.html ./WD.html

api/index.html: api/index.src.html
	bikeshed -f spec ./api/index.src.html

cookies/index.html: cookies/index.src.html
	bikeshed -f spec ./cookies/index.src.html

pinning/index.html: pinning/index.src.html
	bikeshed -f spec ./pinning/index.src.html

publish:
	git push origin master
