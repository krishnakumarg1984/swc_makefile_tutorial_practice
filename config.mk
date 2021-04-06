# Count words script.
LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# Test Zipf's rule
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

# PLOT_SRC=plotcounts.py
# PLOT_EXE=$(LANGUAGE) $(PLOT_SRC)

TXT_DIR=books
TXT_FILES=$(wildcard $(TXT_DIR)/*.txt)
# DAT_FILES=$(patsubst $(TXT_DIR)/%.txt, %.dat, $(TXT_FILES))
# PNG_FILES=$(patsubst %.dat, %.png, $(DAT_FILES))
# RESULTS_FILE=results.txt
# ZIPF_DIR=zipf_analysis
# ZIPF_ARCHIVE=$(ZIPF_DIR).tar.gz
