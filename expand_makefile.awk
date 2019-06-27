#!/usr/bin/env awk

{
    if (NF == 2 && $1 == "include") {
        while ((getline line < $2) > 0)
            print line
        close($2)
    } else
    print
}
