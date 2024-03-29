# Summary table
# results.txt : abyss.dat isles.dat last.dat
	# python testzipf.py abyss.dat isles.dat last.dat > results.txt
	# python testzipf.py abyss.dat isles.dat last.dat > $@
	# python testzipf.py $^ > $@
# results.txt : testzipf.py abyss.dat isles.dat last.dat
# 	python $< *.dat > $@

# ZIPF_SRC=testzipf.py
# ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

# Count words script.
LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# Test Zipf's rule
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

PLOT_SRC=plotcounts.py
PLOT_EXE=$(LANGUAGE) $(PLOT_SRC)

TXT_DIR=books
TXT_FILES=$(wildcard $(TXT_DIR)/*.txt)
DAT_FILES=$(patsubst $(TXT_DIR)/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst %.dat, %.png, $(DAT_FILES))

# ZIPF_DIR=zipf_analysis
# ZIPF_ARCHIVE=$(ZIPF_DIR).tar.gz

.PHONY : all
all : results.txt $(PNG_FILES)

# results.txt : $(ZIPF_SRC) abyss.dat isles.dat last.dat
	# $(ZIPF_EXE) *.dat > $@

## results.txt : Generate Zipf summary table.
results.txt : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

## variables   : Print variables.
.PHONY : variables
variables:
	@echo TXT_FILES : $(TXT_FILES)
	@echo DAT_FILES : $(DAT_FILES)


## dats        : Count words in text files.
.PHONY : dats
# dats: isles.dat abyss.dat last.dat
dats: $(DAT_FILES)

## pngs        : Plot the histograms of top word counts from dat files
.PHONY : pngs
pngs: $(PNG_FILES)

%.png : %.dat
	$(PLOT_EXE) $< $@


# isles.dat : books/isles.txt countwords.py
# 	# python countwords.py books/isles.txt isles.dat
# 	python countwords.py $< $@
#
# abyss.dat : books/abyss.txt countwords.py
# 	# python countwords.py books/abyss.txt abyss.dat
# 	python countwords.py $< $@
#
# last.dat : books/last.txt countwords.py
# 	# python countwords.py books/last.txt last.dat
# 	python countwords.py $< $@

# COUNT_SRC=countwords.py
# LANGUAGE=python
# COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# The % wildcard can only be used in targets and dependencies. Not in actions
%.dat : books/%.txt $(COUNT_SRC)
	# python countwords.py $< $*.dat
	# python countwords.py $< $@
	$(COUNT_EXE) $< $@

# clean :
# 	rm -f *.dat

## clean       : Remove auto-generated files.
.PHONY : clean
clean:
	rm -f *.dat results.txt *.png callgrind.out.*


# .PHONY : help
# help :
# 	@echo "results.txt : Generate Zipf summary table."
# 	@echo "dats        : Count words in text files."
# 	@echo "clean       : Remove auto-generated files."

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
