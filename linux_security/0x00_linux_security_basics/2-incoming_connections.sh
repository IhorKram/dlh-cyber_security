#!/bin/bash
sudo iptables-restore < <(echo -e "*filter\n:INPUT DROP [0:0]\n:FORWARD DROP [0:0]\n:OUTPUT ACCEPT [0:0]\n-A INPUT -p tcp --dport 80 -j ACCEPT\n-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT\nCOMMIT")
