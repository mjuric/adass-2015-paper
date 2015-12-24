REVISION := $(shell git describe --dirty --always)
REMOTE := $(shell git config --get remote.origin.url)
TARBALL := O3-1_v5

all:
	pdflatex O3-1.tex
	bibtex O3-1
	pdflatex O3-1
	pdflatex O3-1

tarball:
	@rm -rf $(TARBALL)
	@mkdir $(TARBALL)
	@echo "Generated from revision '$(REVISION)' of '$(REMOTE)'" > $(TARBALL)/README.md
	@cp -a O3-1*.eps O3-1.tex O3-1.bib copyright/aspcs_copyright_form.pdf $(TARBALL)
	@tar cjvf $(TARBALL).tar.gz $(TARBALL)
	@echo The manuscript has been tarballed into $(TARBALL).tar.gz
