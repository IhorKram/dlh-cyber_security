#!/bin/bash
nslookup -type=MX "$1" | grep "mail exchanger" | cut -d' ' -f4-
