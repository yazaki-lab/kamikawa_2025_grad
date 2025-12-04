.SUFFIXES: .pdf .dvi .html .bbl .aux .tex .bib
.PHONEY: all diff file-diff git-diff watch diff-watch cleanbib clean cleanall


PROJECT = thesis
LATEXMK = latexmk
LATEXMK_OPT = -r latexmkrc
LATEXDIFF = latexdiff
SRC = $(PROJECT).tex
PDF = $(PROJECT).pdf

# DIFF_ORG_FILE_PATH=../rev02_1stSubmit/ipsj_journal201708.tex
DIFF_DIR=./diff
LATEXDIFF-VC_ORG_REV = 0e5b7050327f658d07455b3ff2197c4b56c1883e
LATEXDIFF-VC = latexdiff-vc -e utf8 --git --force -d $(DIFF_DIR) -r $(LATEXDIFF-VC_ORG_REV)
DIFF_SRC = $(DIFF_DIR)/$(SRC)
DIFF_PDF = $(DIFF_DIR)/$(PDF)

all: $(PDF)

diff: file-diff

file-diff: $(DIFF_PDF)

git-diff: $(SRC)
	$(LATEXDIFF-VC) $< && make -C $(DIFF_DIR)

watch: $(SRC)
	$(LATEXMK) $(LATEXMK_OPT) -pvc $<

diff-watch: $(DIFF_PDF)
	make -C $(DIFF_DIR) watch

$(PDF): $(SRC)
	$(LATEXMK) $(LATEXMK_OPT) $<

# $(DIFF_SRC): $(DIFF_ORG_FILE_PATH) $(SRC)
#   $(LATEXDIFF) $(DIFF_ORG_FILE_PATH) $(SRC) > $@

$(DIFF_PDF): $(DIFF_SRC)

clean:
	$(LATEXMK) -C
