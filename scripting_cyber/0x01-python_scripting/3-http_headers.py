#!/usr/bin/env python3
import requests

def get_http_headers(url):
    try:
        response = requests.get(url, timeout=10)
        return {
            'status_code': response.status_code,
            'headers': dict(response.headers)
        }
    except requests.exceptions.RequestException:
        return None

if __name__ == "__main__":
    target_url = "https://www.google.com"
    result = get_http_headers(target_url)
    
    if result:
        print(f"[+] Target: {target_url}")
        print(f"[+] Status Code: {result['status_code']}\n")
        print("[ * ] Response Headers:")
        for key, value in result['headers'].items():
            print(f"    {key}: {value}")
    else:
        print(f"[-] Failed to connect to {target_url}")