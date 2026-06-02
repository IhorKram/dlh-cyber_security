#!/usr/bin/env python3
import socket

def resolve_domain_to_ipv4(domain_name):
    try:
        return socket.gethostbyname(domain_name)
    except socket.gaierror:
        return None
    except Exception as e:
        return f"An error occurred: {e}"

if __name__ == "__main__":
    target = "example.com"
    ip = resolve_domain_to_ipv4(target)
    
    if ip:
        print(f"[+] {target} resolved to {ip}")
    else:
        print(f"[-] Could not resolve {target}")