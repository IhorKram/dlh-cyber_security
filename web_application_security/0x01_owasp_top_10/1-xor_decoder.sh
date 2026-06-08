#!/bin/bash
hash="${1#\{xor\}}"

echo "$hash" | perl -e 'use MIME::Base64; print join("", map { chr(ord($_) ^ 0x5f); } split("", decode_base64(<>)))'
