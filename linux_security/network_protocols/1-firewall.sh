#!/bin/bash
sudo iptables -P INPUT DROP; sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT --dport ssh -j ACCEPT
