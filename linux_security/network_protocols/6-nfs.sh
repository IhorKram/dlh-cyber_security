#!/bin/bash
for ip in $(nmap -p 111 --open -oG - $1 | awk '/Up$/ {print $2}'); do showmount -e $ip; done
