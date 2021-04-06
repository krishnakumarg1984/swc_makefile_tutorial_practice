# Summary table
# results.txt : abyss.dat isles.dat last.dat
	# python testzipf.py abyss.dat isles.dat last.dat > results.txt
	# python testzipf.py abyss.dat isles.dat last.dat > $@
	# python testzipf.py $^ > $@
# results.txt : testzipf.py abyss.dat isles.dat last.dat
# 	python $< *.dat > $@

# ZIPF_SRC=testzipf.py
# ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

include config.mk

results.txt : $(ZIPF_SRC) abyss.dat isles.dat last.dat
	$(ZIPF_EXE) *.dat > $@

.PHONY : variables
variables:
	@echo TXT_FILES : $(TXT_FILES)
	@echo DAT_FILES : $(DAT_FILES)


# Count words.
.PHONY : dats
dats: isles.dat abyss.dat last.dat

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

.PHONY : clean
clean:
	rm -f *.dat results.txt
