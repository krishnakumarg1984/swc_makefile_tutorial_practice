# $^ = dependencies of current rule
# $@ = target of current rule
# $< = first dependency of current rule
# % = pattern rule (only allowed in targets & dependencies, not in actions)
# $* = Wildcard (in actions) to replace the stem with which the rule matched

LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

# Generate summary table
results.txt : $(ZIPF_SRC) isles.dat abyss.dat last.dat
	$(ZIPF_EXE) *.dat > $@

.PHONY: dats
dats: isles.dat abyss.dat last.dat

# Count words.
%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

.PHONY: clean
clean:
	rm -f *.dat
	rm -f results.txt
	rm -f callgrind*
