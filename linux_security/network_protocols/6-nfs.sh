#!/bin/bash
for ip in $(nmap -p 111 --open -oG - 192.168.1.0/24 | awk '/Up$/ {print $2}'); do showmount -e $ip; done
