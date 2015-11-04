REVISION := $(shell git describe --dirty --always)
REMOTE := $(shell git config --get remote.origin.url)
TARBALL := O3-1_v1

all:
	pdflatex O3-1.tex
	bibtex O3-1
	pdflatex O3-1
	pdflatex O3-1

tarball:
	@rm -rf $(TARBALL)
	@mkdir $(TARBALL)
	@echo "Generated from revision '$(REVISION)' of '$(REMOTE)'" > $(TARBALL)/README.md
	@cp -a *.pdf *.tex *.bib $(TARBALL)
	@tar cjvf $(TARBALL).tar.gz $(TARBALL)
	@echo The manuscript has been tarballed into $(TARBALL).tar.gz
