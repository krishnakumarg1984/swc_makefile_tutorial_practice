rule summarise_results:
    input:
        "isles.dat",
        "abyss.dat",
        "last.dat",
    output:
        "results.txt",
    shell:
        "python testzipf.py abyss.dat isles.dat last.dat > results.txt"


rule dats:
    input:
        "isles.dat",
        "abyss.dat",
        "last.dat",


rule count_words_isles:
    input:
        "books/isles.txt",
    output:
        "isles.dat",
    shell:
        "python countwords.py books/isles.txt isles.dat"


rule count_words_abyss:
    input:
        "books/abyss.txt",
    output:
        "abyss.dat",
    shell:
        "python countwords.py books/abyss.txt abyss.dat"


rule count_words_last:
    input:
        "books/last.txt",
    output:
        "last.dat",
    shell:
        "python countwords.py books/last.txt last.dat"


rule clean:
    shell:
        """
        rm -f *.dat
        rm -f results.txt
        rm -f *.png
        """
