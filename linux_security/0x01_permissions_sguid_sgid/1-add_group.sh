#!/bin/bash
addgroup "$1"
chmod :"$1" "$2"
chmod g+rx "$2"
