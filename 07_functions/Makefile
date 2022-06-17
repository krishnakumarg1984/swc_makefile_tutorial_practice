include config.mk

TXT_FILES=$(wildcard books/*.txt)

.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)

# Generate summary table.
results.txt : $(ZIPF_SRC) isles.dat abyss.dat last.dat
	$(ZIPF_EXE) *.dat > $@

# Count words.
.PHONY : dats
dats : isles.dat abyss.dat last.dat

# Build a .dat file from the corresponding .txt file in books/
%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $*.dat

.PHONY : clean
clean :
	rm -f *.dat results.txt

.PHONY : list_targets
list_targets:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
