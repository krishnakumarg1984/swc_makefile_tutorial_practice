# Generate summary table
# $^ = dependencies of current rule
# $@ = target of current rule
results.txt : isles.dat abyss.dat last.dat
	python testzipf.py $^ > $@

# Count words.
isles.dat : books/isles.txt
	python countwords.py books/isles.txt isles.dat

abyss.dat : books/abyss.txt
	python countwords.py books/abyss.txt abyss.dat

last.dat : books/last.txt
	python countwords.py books/last.txt last.dat

.PHONY: clean
clean:
	rm -f *.dat results.txt
