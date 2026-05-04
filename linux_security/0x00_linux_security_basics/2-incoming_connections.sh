#!/bin/bash
sudo iptables -F
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -P INPUT DROP
sudo ip6tables -F
sudo ip6tables -P INPUT DROP
