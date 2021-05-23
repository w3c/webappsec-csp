SHELL=/bin/bash

all: index.html ./api/index.html ./cookies/index.html ./pinning/index.html

force:
	bikeshed -f spec ./index.bs
	bikeshed -f spec ./api/index.bs
	bikeshed -f spec ./cookies/index.bs
	bikeshed -f spec ./pinning/index.bs

index.html: index.bs
	bikeshed -f spec ./index.bs

FPWD:
	bikeshed -f spec --md-status=FPWD --md-date=2015-01-19 ./index.bs ./published/FPWD-2015-01.html

WD:
	bikeshed -f spec --md-status=WD ./index.bs ./WD.html

api/index.html: api/index.bs
	bikeshed -f spec ./api/index.bs

cookies/index.html: cookies/index.bs
	bikeshed -f spec ./cookies/index.bs

pinning/index.html: pinning/index.bs
	bikeshed -f spec ./pinning/index.bs

ci: out/index.html

out/index.html: index.bs
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
