#!/bin/bash
last -n 5 | awk '{print "User: "$1" | Login time: "$4" "$5" "$6" "$7}'
