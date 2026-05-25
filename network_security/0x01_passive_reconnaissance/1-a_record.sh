#!/bin/bash
nslookup -type=A "$1" | grep -A1 -A1 "^Name:" | grep "^Address:" | cut -d' ' -f2
