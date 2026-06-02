#!/usr/bin/env python3

import socket

def check_port(host, port):
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(2.0)
            result = s.connect_ex((host, port))
            return result == 0
    except Exception:
        return False

if __name__ == "__main__":
    target_host = "scanme.nmap.org"
    target_port = 80
    print(f"[ * ] Scanning {target_host} on port {target_port}...")
    if check_port(target_host, target_port):
        print(f"[+] Port {target_port} is OPEN")
    else:
        print(f"[-] Port {target_port} is CLOSED or FILTERED")