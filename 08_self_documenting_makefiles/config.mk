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
