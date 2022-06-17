# Generate summary table.
results.txt : testzipf.py isles.dat abyss.dat last.dat
	python $< *.dat > $@

# Count words.
.PHONY : dats
dats : isles.dat abyss.dat last.dat

# Build a .dat file from the corresponding .txt file in books/
# “In order to build a file named [something].dat (i.e. the target), find a file named books/[that same something].txt (i.e. the dependency) and run countwords.py [the dependency] [the target].”
# The Make % wildcard can only be used in a target and in its dependencies. It cannot be used in actions.
%.dat : books/%.txt countwords.py
	python countwords.py $< $@

.PHONY : clean
clean :
	rm -f *.dat results.txt

.PHONY : list_targets
list_targets:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
