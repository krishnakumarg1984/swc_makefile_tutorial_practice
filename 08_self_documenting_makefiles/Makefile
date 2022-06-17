include config.mk

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst %.dat, %.png, $(DAT_FILES))

#: all         : build the targets 'results.txt' and 'pngs'
.PHONY : all
all : results.txt pngs

#: results.txt : Generate Zipf summary table.
results.txt : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

#: dats        : Count words in text files.
.PHONY : dats
dats : $(DAT_FILES)

# Build each .dat file from the corresponding .txt file in books/
%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

#: pngs        : Plot wordcount from dat files
.PHONY : pngs
pngs : $(PNG_FILES)

# Build each .png file from the corresponding .dat file
%.png : %.dat
	$(PLOT_EXE) $< $@

#: clean       : Remove auto-generated files.
.PHONY : clean
clean :
	rm -f $(DAT_FILES) $(PNG_FILES) results.txt
	rm -f callgrind.out.*

#: variables   : Print variables.
.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

#: help        : Show help on available targets in the Makefile
.PHONY : help
help : Makefile
	@sed -n 's/^#://p' $<
