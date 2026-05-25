#!/bin/bash
whois "$1" | awk -F': +' '/^(Registrant|Admin|Tech)/ {f=$1; v=$2; if(f ~ /Street$/) v=v" "; if(f ~ /Ext$/) f=f":"; printf "%s, %s\n", f, v}' | awk 'NR>1 {print p} {p=$0} END {printf "%s", p}' | tr -d '\r' | printf "%s" "$(cat)" > "$1.csv"
