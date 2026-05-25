#!/bin/bash
nslookup\s+(-q|-type|-querytype|-query)=?[mM][xX]\s+\$1 "$1" | grep "mail exchanger" | cut -d' ' -f4-
