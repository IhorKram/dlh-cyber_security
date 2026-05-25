#!/bin/bash
sudo sshd -T | grep -Ev "^(permitrootlogin|passwordauthentication|port|pubkeyauthentication|x11forwarding)"
