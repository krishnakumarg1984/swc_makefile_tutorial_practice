include config.mk

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))

# Generate summary table.
results.txt : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

# Count words.
.PHONY : dats
dats : $(DAT_FILES)

# Build each .dat file from the corresponding .txt file in books/
%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

.PHONY : clean
clean :
	rm -f $(DAT_FILES) results.txt
.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
