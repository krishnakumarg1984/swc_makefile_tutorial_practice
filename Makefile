# Summary table
# results.txt : abyss.dat isles.dat last.dat
	# python testzipf.py abyss.dat isles.dat last.dat > results.txt
	# python testzipf.py abyss.dat isles.dat last.dat > $@
	# python testzipf.py $^ > $@
results.txt : testzipf.py abyss.dat isles.dat last.dat
	python $< *.dat > $@

# Count words.
.PHONY : dats
dats: isles.dat abyss.dat last.dat

isles.dat : books/isles.txt countwords.py
	# python countwords.py books/isles.txt isles.dat
	python countwords.py $< $@

abyss.dat : books/abyss.txt countwords.py
	# python countwords.py books/abyss.txt abyss.dat
	python countwords.py $< $@

last.dat : books/last.txt countwords.py
	# python countwords.py books/last.txt last.dat
	python countwords.py $< $@


# clean :
# 	rm -f *.dat

.PHONY : clean
clean:
	rm -f *.dat results.txt
