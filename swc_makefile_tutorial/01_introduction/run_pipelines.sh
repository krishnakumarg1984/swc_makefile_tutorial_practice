#!/bin/bash

# USAGE: bash run_pipeline.sh
# to produce plots for isles and abyss and the summary table for the Zipf's law tests

# These lines are commented out because they don't need to be rerun.
# python countwords.py books/isles.txt isles.dat
# python countwords.py books/abyss.txt abyss.dat

python plotcounts.py isles.dat isles.png
python plotcounts.py abyss.dat abyss.png

# Generate summary table
# This line is also commented out because it doesn't need to be rerun.
# python testzipf.py abyss.dat isles.dat >results.txt
