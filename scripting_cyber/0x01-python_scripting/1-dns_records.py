#!/usr/bin/env python3
import dns.resolver

def query_dns_records(domain_name):
    record_types = ['A', 'AAAA', 'MX', 'NS', 'TXT', 'SOA']
    results = {}
    
    for rtype in record_types:
        try:
            answers = dns.resolver.resolve(domain_name, rtype)
            results[rtype] = answers
        except (dns.resolver.NoAnswer, dns.resolver.NXDOMAIN, dns.resolver.NoNameservers):
            continue
        except Exception:
            continue
            
    return results

if __name__ == "__main__":
    target = "google.com"
    dns_data = query_dns_records(target)
    
    print(f"[ * ] DNS Reconnaissance for: {target}\n")
    for rtype, answers in dns_data.items():
        print(f"[+] Record Type: {rtype}")
        for rdata in answers:
            print(f"    - {rdata}")