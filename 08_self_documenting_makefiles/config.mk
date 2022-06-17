# Count words script.
LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# Test Zipf's rule
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

# Plot word count
PLOT_SRC=plotcounts.py
PLOT_EXE=$(LANGUAGE) $(PLOT_SRC)

ARCHIVE_DIR=zipf_analysis
ARCHIVE_FILE=$(ARCHIVE_DIR).tar.gz
RESULTS_FILE=results.txt
TXT_DIR=books

TXT_FILES=$(wildcard $(TXT_DIR)/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst %.dat, %.png, $(DAT_FILES))

