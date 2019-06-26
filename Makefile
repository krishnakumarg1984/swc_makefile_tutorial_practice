# $^ = dependencies of current rule
# $@ = target of current rule
# $< = first dependency of current rule

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
	rm -f *.dat results.txt
