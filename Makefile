package = hello
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)

all clean hello:
	$(MAKE) -C libhello $@
	$(MAKE) -C src $@

dist: $(distdir).tar.gz

$(distdir).tar.gz: $(distdir)
	tar chof - $(distdir) | gzip -9 -c > $(distdir).tar.gz
	rm -rf $(distdir)

$(distdir):
	mkdir -p $(distdir)/src
	cp Makefile $(distdir)
	cp src/Makefile $(distdir)/src
	cp src/main.c $(distdir)/src

distcheck: $(distdir).tar.gz
	gzip -cd $+ | tar xvf -
	$(MAKE) -C $(distdir) all clean
	rm -rf $(distdir)
	@echo "*** Package $(distdir).tar.gz ready for distribution ***"

FORCE:
	-rm $(distdir).tar.gz &> /dev/null
	-rm -rf $(distdir) &> /dev/null

.PHONY: FORCE all clean dist distcheck
