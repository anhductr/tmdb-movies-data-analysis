#!/bin/bash

awk '
{
    line = $0

    if (record == "")
        record = line
    else
        record = record " " line

    for (i=1; substr(line,i,1)!=""; i++) {
        c = substr(line,i,1)

        if (c == "\"") {
            if (inquote && substr(line,i+1,1) == "\"")
                i++
            else
                inquote = !inquote
        }
    }

    if (inquote)
        next

    output = ""
    q = 0

    for (i=1; substr(record,i,1)!=""; i++) {
        c = substr(record,i,1)

        if (c == "\"")
            q = !q

        if (c == "," && q)
            c = ";"

        output = output c
    }

    print output

    record = ""
}
' data/tmdb-movies.csv > data/tmdb-movies-clean.csv

