# $^ = dependencies of current rule
# $@ = target of current rule
# $< = first dependency of current rule
# % = pattern rule (only allowed in targets & dependencies, not in actions)
# $* = Wildcard (in actions) to replace the stem with which the rule matched

# Generate summary table
results.txt : testzipf.py isles.dat abyss.dat last.dat
	python $< *.dat > $@

.PHONY: dats
dats: isles.dat abyss.dat last.dat

# Count words.
%.dat : books/%.txt countwords.py
	python countwords.py $< $@

.PHONY: clean
clean:
	rm -f *.dat
	rm -f results.txt
	rm -f callgrind*
