#!/bin/bash
echo -e "*filter\n:INPUT DROP\n-A INPUT -p tcp --dport 80 -j ACCEPT\nCOMMIT" | sudo iptables-restore
