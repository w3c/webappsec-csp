SHELL=/bin/bash

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

ci: out/index.html

out/index.html: index.src.html
	mkdir -p out
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output $@ \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=nothing \
	                       -F file=@$<) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat $@; echo ""; \
		$(RM) -r out; \
		exit 22 \
	);

clean:
	$(RM) -r out
	$(RM) index.html
