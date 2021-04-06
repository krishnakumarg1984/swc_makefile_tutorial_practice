# Count words.
.PHONY : dats
dats: isles.dat abyss.dat

isles.dat : books/isles.txt
	python countwords.py books/isles.txt isles.dat

abyss.dat : books/abyss.txt
	python countwords.py books/abyss.txt abyss.dat

# clean :
# 	rm -f *.dat

.PHONY : clean
clean:
	rm -rf *.dat
