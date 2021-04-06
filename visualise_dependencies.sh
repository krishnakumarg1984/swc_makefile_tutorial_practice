#!/usr/bin/env bash

remake clean
remake --targets -r | \grep -v % | \grep -v '\t*\.'^C | xargs remake -n --profile -B pngs

for profile_file in callgrind.out.*; do
    gprof2dot -n0 -e0 -f callgrind "$profile_file" | dot -Tpng -o graph_of_makefile.png
done

