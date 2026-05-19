#!/bin/bash
salt=$(openssl rand -hex 8) && echo -n "${1}${salt}" | openssl dgst -sha512 -r | awk '{print $1}' > 3_hash.txt
