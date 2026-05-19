#!/bin/bash
hashcat -m 1000 "$1" wordlist.txt && hashcat -m 1000 "$1" --show | awk -F: '{print $2}' > 5-password.txt
