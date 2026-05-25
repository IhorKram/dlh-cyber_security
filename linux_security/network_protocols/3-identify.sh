#!/bin/bash
sudo lynis audit system --quick | grep -E "warning|vulnerable|update"
