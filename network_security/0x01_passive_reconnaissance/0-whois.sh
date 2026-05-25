#!/bin/bash
whois "$1" | awk -F': +' '/^(Registrant|Admin|Tech)/ {f=$1; v=$2; if(f ~ /Street$/) v=v" "; if(f ~ /Ext$/) f=f":"; a[++c]=f","(v!=""?" "v:"")} END {for(i=1;i<=c;i++) printf "%s", a[i] (i==c?"":"\n")}' > "$1.csv"
