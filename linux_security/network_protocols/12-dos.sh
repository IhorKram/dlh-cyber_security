#!/bin/bash
sudo hping3 -S -p 80 --flood --rand-source 127.0.0.1
