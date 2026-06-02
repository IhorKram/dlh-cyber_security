#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse

def crawl_website(start_url, max_depth=2):
    visited = set()
    try:
        base_domain = urlparse(start_url).netloc
        if not base_domain:
            return set()
    except Exception:
        return set()

    def _crawl(url, current_depth):
        if current_depth > max_depth or url in visited:
            return

        try:
            response = requests.get(url, timeout=5)
            if "text/html" not in response.headers.get("Content-Type", ""):
                return
            visited.add(url)
            if current_depth == max_depth:
                return
            soup = BeautifulSoup(response.text, 'html.parser')
            for anchor in soup.find_all('a', href=True):
                absolute_url = urljoin(url, anchor['href'])
                absolute_url = urlparse(absolute_url)._replace(fragment='').geturl()
                if urlparse(absolute_url).netloc == base_domain:
                    _crawl(absolute_url, current_depth + 1)

        except (requests.exceptions.RequestException, Exception):
            return

    _crawl(start_url, 0)
    return visited

if __name__ == "__main__":
    target = "https://google.com"
    print(f"[ * ] Crawling {target} (Max Depth: 2)...")
    
    discovered_links = crawl_website(target, max_depth=2)
    
    print(f"\n[+] Found {len(discovered_links)} internal pages:")
    for link in sorted(discovered_links):
        print(f"    {link}")
