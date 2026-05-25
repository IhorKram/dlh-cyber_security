#!/bin/bash
whois "$1" | awk -F': +' '
/^(Registrant|Admin|Tech)/ {
    f = $1; v = $2
    if (f ~ /Street$/) v = v " "
    if (f ~ /Ext$/) f = f ":"
    
    # Store lines in an array instead of printing immediately
    lines[++count] = f "," v
}
END {
    # Print lines with newlines between them, leaving no newline at the very end
    for (i = 1; i <= count; i++) {
        printf "%s", lines[i] (i == count ? "" : "\n")
    }
}' > "$1.csv"
