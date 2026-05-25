#!/bin/bash
grep -q "Smtpd_tls_security_level = may" /etc/postfix/main.cf || echo "STARTTLS not configured"
