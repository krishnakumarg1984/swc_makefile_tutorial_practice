# Count words.
.PHONY : dats
dats: isles.dat abyss.dat last.dat

isles.dat : books/isles.txt
	python countwords.py books/isles.txt isles.dat

abyss.dat : books/abyss.txt
	python countwords.py books/abyss.txt abyss.dat

last.dat : books/last.txt
	python countwords.py books/last.txt last.dat

# clean :
# 	rm -f *.dat

.PHONY : clean
clean:
	rm -rf *.dat
