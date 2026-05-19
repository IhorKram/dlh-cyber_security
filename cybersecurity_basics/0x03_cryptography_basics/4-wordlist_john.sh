#!/bin/bash
john --wordlist=/usr/share/john/password.lst "$1" && john --show "$1" | awk -F: '{print $2}' > /home/student_jail/student_repo/cybersecurity_basics/0x03_cryptography_basics/4-password.txt
