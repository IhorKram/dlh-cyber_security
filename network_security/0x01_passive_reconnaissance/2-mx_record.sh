#!/bin/bash
nslookup -type=mx "$1" | grep "mail exchanger" | cut -d' ' -f4-
