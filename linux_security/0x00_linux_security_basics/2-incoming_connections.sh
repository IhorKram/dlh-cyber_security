#!/bin/bash
echo -e "default deny incoming\ndefault allow outgoing\nallow from $1 to any port 80 proto tcp\nenable" | xargs -I {} sudo ufw {}
