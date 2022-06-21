#!/usr/bin/env bash

if [ -x "$(command -v remake)" ] && [ -x "$(command -v gprof2dot)" ]; then
  rm -f callgrind.out.*
  # remake clean

  # https://unix.stackexchange.com/questions/283478/how-to-display-dependencies-given-in-a-makefile-as-a-tree
  remake -rR --targets | grep -v % | grep -v '\t*\.' | awk '{$1=$1};!/^\.|Makefile/' | awk '{print $1}' | xargs remake -n --profile -B >/dev/null

  DAG_PNG_FILENAME=profiled_makefile_dag.png
  rm -f "$DAG_PNG_FILENAME"

  for profile_file in callgrind.out.*; do
    gprof2dot -n0 -e0 -f callgrind "$profile_file" | dot -Tpng -o "$DAG_PNG_FILENAME" && open "$DAG_PNG_FILENAME"
  done
fi
