1. Healthcare Mobile App

## 1. Critical Asset Identification (CIA Triad)

The most critical asset in this system is **Protected Health Information (PHI)**, which includes patient medical records, provider messages, and prescription data.

* **Confidentiality (Highest Priority):** Unauthorized access to PHI directly violates privacy laws (e.g., HIPAA) and compromises patient privacy. Medical histories cannot be "un-leaked."
* **Integrity (Critical):** If an attacker alters medical records, dosages, or provider messages, doctors could make incorrect clinical decisions, directly endangering human life.
* **Availability (High):** Patients and providers need access to schedules and records, but a temporary outage is less damaging than a permanent data breach or corrupted medical instructions.

---

## 2. STRIDE Threat Analysis (Messaging Feature)

### Threat 1: Spoofing (Identity Theft)
* **Description:** An attacker steals a doctor's session credentials and sends malicious or fake medical advice to a patient.
* **Impact:** Severe risk to patient health due to wrong medical instructions; loss of trust in the platform.

### Threat 2: Tampering (Message Alteration)
* **Description:** A malicious actor intercepts the network traffic between the mobile client and the REST API to modify prescription refill requests or clinical symptoms within a message.
* **Impact:** Wrong medication or dosages may be issued, or critical conditions may go ignored.

### Threat 3: Repudiation (Denial of Action)
* **Description:** The system lacks sufficient audit logging, allowing a provider to falsely deny sending a negligent message, or a patient to deny requesting a dangerous refill.
* **Impact:** Inability to legally defend actions or audit clinical errors; compliance failure.

### Threat 4: Information Disclosure (Eavesdropping)
* **Description:** Messages are stored or transmitted in cleartext, allowing an attacker on a local network or via a compromised database backup to read private conversations.
* **Impact:** Massive PHI data breach, massive legal penalties, and extortion risks.

---

## 3. Prioritized Security Controls

1.  **Multi-Factor Authentication (MFA) & Biometrics**
    * *Reasoning:* Prevents unauthorized access to accounts (Spoofing). It stops attackers from leveraging stolen passwords to access sensitive medical profiles.
2.  **End-to-End Encryption (E2EE) / Transport Encryption (TLS 1.3 & AES-256)**
    * *Reasoning:* Protects patient data both in transit (from the app to the API) and at rest (in the cloud database). This mitigates Information Disclosure and Tampering.
3.  **Role-Based Access Control (RBAC)**
    * *Reasoning:* Ensures strict data segregation. Patients can only view their own records; doctors can only access records of patients under their care.
4.  **Immutable Audit Logging**
    * *Reasoning:* Tracks every creation, read, update, and deletion of PHI. This prevents Repudiation and ensures compliance with healthcare regulations.
5.  **API Gateway Rate Limiting & Input Validation**
    * *Reasoning:* Protects the REST API backend from automated attacks, denial of service (DoS), and injection vulnerabilities that could threaten system Availability.
