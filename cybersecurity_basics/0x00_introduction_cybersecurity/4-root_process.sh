#!/bin/bash
ps -u "$1" -o pid,vsz,rss,cmd | grep -vE '^[[:space:]]*PID|[[:space:]]0[[:space:]]+0[[:space:]]'
