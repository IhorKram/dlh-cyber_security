#!/bin/bash
sudo semanage port -l | grep -v "http"
