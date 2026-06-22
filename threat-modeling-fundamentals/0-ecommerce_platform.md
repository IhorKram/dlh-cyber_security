0. E-commerce Platform

## 1. STRIDE Threat Analysis (Checkout Process)

### Threat 1: Price Manipulation via Frontend Request
* **STRIDE Category:** Tampering
* **Threat Description:** A malicious user intercepts the checkout API request (e.g., using a proxy tool like Burp Suite) and modifies the product price or quantity parameters to a lower value before submission to the server.
* **Potential Impact:** Financial loss for the platform due to selling products below cost or for free.
* **Suggested Mitigation:** Never trust prices submitted by the client. Perform all price calculations, totals, and validations strictly on the Node.js backend using product data queried directly from the PostgreSQL database.

### Threat 2: Payment Token Interception (Man-in-the-Middle)
* **STRIDE Category:** Information Disclosure
* **Threat Description:** An attacker on a public or compromised network sniffs unencrypted or improperly encrypted network traffic during checkout to capture sensitive user data or Stripe payment tokens.
* **Potential Impact:** Theft of customer data, session hijacking, or unauthorized transaction routing.
* **Suggested Mitigation:** Enforce strict HTTPS (TLS 1.3) across the entire platform, implement HTTP Strict Transport Security (HSTS), and utilize Stripe's official frontend SDK (Stripe.js) so sensitive card data never touches the backend directly.

### Threat 3: Session Hijacking or Checkout Spoofing
* **STRIDE Category:** Spoofing
* **Threat Description:** An attacker steals a legitimate user's authentication token (e.g., via Cross-Site Scripting or insecure storage) and submits a checkout request acting as the victim.
* **Potential Impact:** Unauthorized purchases using the victim's saved billing profiles, resulting in financial fraud and reputational damage.
* **Suggested Mitigation:** Store authentication tokens in secure, `HttpOnly`, `SameSite=Strict` cookies, implement short-lived tokens, and re-authenticate or require CVV entry at the exact moment of payment submission.

---

## 2. Trust Boundaries

A trust boundary is a location where program execution or data changes its trust level. In this architecture, three distinct trust boundaries exist:

1.  **User Browser (React Frontend) ↔ Node.js API Backend:** The boundary separating untrusted user-controlled client environments from the corporate-controlled server environment. All incoming data from this boundary must be treated as malicious.
2.  **Node.js API Backend ↔ PostgreSQL Database:** A boundary within the trusted zone where backend application logic requests persistent data storage. Access must be restricted using the principle of least privilege (e.g., strict DB user permissions).
3.  **Node.js API Backend ↔ Stripe Third-Party API:** The boundary separating the internal server architecture from an external, trusted financial service provider over the public internet, requiring secure API keys and webhook validation.

---

## 3. DREAD Rating: SQL Injection in Product Search

**Overall Risk Score: 6.8 / 10 (High)**

| Factor | Score | Justification |
| :--- | :---: | :--- |
| **Damage (D)** | **9** | Critical. Successful SQL injection could allow attackers to bypass authentication, read sensitive customer data from PostgreSQL, or drop/modify tables entirely. |
| **Reproducibility (R)** | **8** | High. If a search input is vulnerable and un-sanitized, an attacker can reliably execute the same malicious payload repeatedly to extract data. |
| **Exploitability (E)** | **7** | Medium-High. Product search functionality is public (no auth required). Automated tools like `sqlmap` on Kali Linux can easily discover and exploit it. |
| **Affected Users (A)** | **6** | Medium. While it directly exposes database contents, the impact scales to all users if global data (credentials, order history) is leaked, though it doesn't directly crash individual browsers. |
| **Discoverability (D)** | **4** | Medium-Low. The search input itself is completely public and high-profile, making it one of the first elements any threat actor or automated scanner will probe. |
