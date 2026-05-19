#!/bin/bash
hashcat -m 1000 "$1" /usr/share/wordlists/rockyou.txt && hashcat -m 1000 "$1" --show | awk -F: '{print $2}' > 7-password.txt
