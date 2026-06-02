#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

def download_page(url):
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')
        return soup.prettify()
    except requests.exceptions.RequestException as e:
        return f"[-] HTTP Request failed: {e}"

if __name__ == "__main__":
    target_url = "http://example.com"
    print(f"[ * ] Fetching: {target_url}\n")
    html_content = download_page(target_url)
    print(html_content)