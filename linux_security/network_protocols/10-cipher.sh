#!/bin/bash
nmap -p 443 --script ssl-enum-ciphers $1 | grep -E "(status:|64|DES|RC4|IDEA|SEED)"
