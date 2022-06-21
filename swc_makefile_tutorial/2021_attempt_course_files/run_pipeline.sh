#!/usr/bin/env bash

# USAGE: bash run_pipeline.sh
# to produce plots for isles and abyss
# and the summary table for the Zipf's law tests

rm results.txt *.png *.dat 2> /dev/null

# python countwords.py books/isles.txt isles.dat
# python countwords.py books/abyss.txt abyss.dat

for booktxt in books/*.txt; do
    # https://stackoverflow.com/questions/2664740/extract-file-basename-without-path-and-extension-in-bash
    booknametmp=${booktxt##*/}
    bookname=${booknametmp%.*}
    python countwords.py "$booktxt" "$bookname".dat
done

# python plotcounts.py isles.dat isles.png
# python plotcounts.py abyss.dat abyss.png

for bookdat in *.dat; do
    bookdattmp=${bookdat##*/}
    bookname=${bookdattmp%.*}
    python plotcounts.py "$bookdat" "$bookname".png
done

# Generate summary table
# python testzipf.py abyss.dat isles.dat >results.txt
python testzipf.py *.dat >results.txt
