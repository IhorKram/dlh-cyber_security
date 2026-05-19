#!/bin/bash
hashcat --stdout -a 1 wordlist1.txt wordlist2.txt | hashcat -m 1000 "$1" | hashcat -m 1000 "$1" --show | awk -F: '{print $2}' > 9-password.txt
