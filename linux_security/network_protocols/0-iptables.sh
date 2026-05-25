#!/bin/bash
sudo iptables -L -v --line-numbers | grep -E "num|RETURN"
