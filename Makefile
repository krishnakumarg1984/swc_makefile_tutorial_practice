# $^ = dependencies of current rule
# $@ = target of current rule
# $< = first dependency of current rule

# Generate summary table
results.txt : isles.dat abyss.dat last.dat testzipf.py
	python testzipf.py $^ > $@

# Count words.
isles.dat : books/isles.txt countwords.py
	python countwords.py $< $@

abyss.dat : books/abyss.txt countwords.py
	python countwords.py $< $@

last.dat : books/last.txt countwords.py
	python countwords.py $< $@

.PHONY: clean
clean:
	rm -f *.dat results.txt
