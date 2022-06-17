include config.mk

TXT_FILES=$(wildcard books/*.txt)

# patsubst (‘pattern substitution’) takes a pattern, a replacement string and a list of names in that order; each name in the list that matches the pattern is replaced by the replacement string.
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))

.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)

# Generate summary table.
results.txt : $(ZIPF_SRC) isles.dat abyss.dat last.dat
	$(ZIPF_EXE) *.dat > $@

# Count words.
.PHONY : dats
dats : $(DAT_FILES)

# Build a .dat file from the corresponding .txt file in books/
%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

.PHONY : clean
clean :
	rm -f $(DAT_FILES) results.txt
