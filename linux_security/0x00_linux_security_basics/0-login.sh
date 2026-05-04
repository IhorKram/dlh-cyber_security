#!/bin/bash
sudo last -n "$1" | awk '{print "User: "$1" | Login time: "$4" "$5" "$6" "$7}'
