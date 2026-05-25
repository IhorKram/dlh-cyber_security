#!/bin/bash
for t in filter nat mangle raw; do echo -e "\n=== TABLE: $t ==="; sudo iptables -t $t -L -v --line-numbers; done
