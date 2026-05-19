#!/bin/bash
john --format=nt --wordlist=wordlist.txt "$1" && john --show "$1" | awk -F: '{print $2}' > 6-password.txt
