#!/bin/bash
grep -Ev "^(#|$)" /etc/ssh/sshd_config | grep -Ev "^(acceptenv|subsystem)"
