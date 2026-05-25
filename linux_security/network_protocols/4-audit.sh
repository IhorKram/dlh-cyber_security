#!/bin/bash
sudo sshd -T | grep -E "^(permitrootlogin|passwordauthentication|port|pubkeyauthentication|x11forwarding)"
