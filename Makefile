REVISION := $(shell git describe --dirty --always)
REMOTE := $(shell git config --get remote.origin.url)
TARBALL := O3-1_v5
ARXIV := arxiv_v1

all:
	pdflatex O3-1.tex
	bibtex O3-1
	pdflatex O3-1
	pdflatex O3-1

# For ADASS submission
tarball:
	@rm -rf $(TARBALL)
	@mkdir $(TARBALL)
	@echo "Generated from revision '$(REVISION)' of '$(REMOTE)'" > $(TARBALL)/README.md
	@cp -a O3-1*.eps O3-1.tex O3-1.bib copyright/aspcs_copyright_form.pdf $(TARBALL)
	@tar cjvf $(TARBALL).tar.gz $(TARBALL)
	@echo The manuscript has been tarballed into $(TARBALL).tar.gz

# For arXiv submission
arxiv:
	@rm -rf $(ARXIV)
	@mkdir $(ARXIV)
	@echo "Generated from revision '$(REVISION)' of '$(REMOTE)'" > $(ARXIV)/README.md
	@cp -a asp2014.sty pdf_figures/O3-1*.pdf O3-1.tex O3-1.bib O3-1.bbl $(ARXIV)
	@./format-author-list.bash O3-1.tex > $(ARXIV)/author_list.txt
	@tar cjvf $(ARXIV).tar.gz $(ARXIV)
	@echo The arXiv ready manuscript has been tarballed into $(ARXIV).tar.gz
	@echo The author list in the proper format is in $(ARXIV)/author_list.txt
