#!/usr/bin/env gawk

# https://unix.stackexchange.com/a/527260
{
  if (NF == 2 && $1 == "include") {
    while ((getline line < $2) > 0)
      print line
    close($2)
  } else
  print
}
