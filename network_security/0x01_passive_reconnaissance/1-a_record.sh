#!/bin/bash
nslookup -type=A "$1" | awk '/^Name:/ {flag=1; next} flag && /^Address:/ {print $2; exit}'
