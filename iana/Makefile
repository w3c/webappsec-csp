id_base = ..
xml2rfc ?= xml2rfc
kramdown-rfc2629 ?= kramdown-rfc2629
idnits ?= idnits

title = west-webappsec-csp-reg
latest = $(shell (ls draft-${title}-*.xml || echo "draft-${title}-00.xml") | sort | tail -1)
version = $(shell basename ${latest} .xml | awk -F- '{print $$NF}')

target = draft-$(title)-$(version)
prev = draft-$(title)-$(shell printf "%.2d" `echo ${version}-1 | bc`)
next = draft-$(title)-$(shell printf "%.2d" `echo ${version}+1 | bc`)

.PHONY: latest clean next diff idnits update

latest: $(target).html $(target).txt

clean:
	rm -f $(target).html $(target).txt

next: 
	cp $(target).xml $(next).xml
	sed -i '' -e"s/$(target)/$(next)/" draft.md

diff: 
	rfcdiff $(prev).txt $(target).txt

idnits: $(target).txt
	$(idnits) $<

%.xml: draft.md
	$(kramdown-rfc2629) $< > $@
	
%.html: %.xml
	$(xml2rfc) --html $< $@

%.txt: %.xml
	$(xml2rfc) $< $@

update:
	cp $(id_base)/Tools/skel/Makefile .
