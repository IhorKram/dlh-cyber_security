#!/bin/bash
nslookup.-(q|query|type|querytype)=[m,M][x,X].\$1 | grep "mail exchanger" | cut -d' ' -f4-
