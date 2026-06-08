#!/bin/bash
hash="${1#\{xor\}}"

echo "$hash" | base64 -d | xxd -p | tr -d '\n' | sed 's/../0x& /g' | while read -r -a bytes; do
    for byte in "${bytes[@]}"; do
        printf "\\x$(printf '%x' "$((byte ^ 0x5f))")"
    done
    echo ""
done
