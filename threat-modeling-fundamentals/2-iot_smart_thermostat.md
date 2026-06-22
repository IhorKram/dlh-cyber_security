2. IoT Smart Thermostat

---

## 1. IoT-Specific Threats

Unlike web applications hosted in secured data centers, IoT devices face unique vectors:

1.  **Physical Tampering and Reverse Engineering:** Attackers can physically disassemble the device to extract firmware, look for hardcoded secrets, or probe hardware components.
2.  **Insecure Firmware / Outdated Components:** Embedded OS binaries often ship with outdated libraries that cannot be easily or frequently patched compared to web applications.
3.  **Hardcoded or Weak Default Credentials:** Many IoT devices ship with universal default passwords or SSH keys for manufacturing/testing that are never changed by the consumer.
4.  **Insecure Direct Device-to-Device Communication:** Use of unencrypted local protocols (e.g., plain MQTT, Zigbee without rotation) to talk to local hubs or mobile apps.
5.  **Resource Constrained DoS:** Limited CPU and RAM make IoT devices highly vulnerable to simple flooding attacks, causing them to freeze or crash.

---

## 2. Physical Access Attack Chain & Impact

If an attacker physically gains access to the thermostat (e.g., in a rental property or via a stolen unit):
[Physical Access] ➔ [Expose Debug Ports (UART/JTAG)] ➔ [Extract Flash Memory / Firmware] ➔ [Extract Hardcoded Credentials/API Keys] ➔ [Pivot to Home Network / Cloud API]

* **Step 1 (Hardware Probing):** The attacker pops off the plastic casing and locates exposed debugging pads on the printed circuit board (PCB), such as UART or JTAG.
* **Step 2 (Bus Spoofing/Dumping):** Using hardware tools, they interface with the flash memory chip and dump the device's entire storage (firmware file system).
* **Step 3 (Extraction):** They reverse engineer the firmware binary to find embedded Wi-Fi configuration scripts, client TLS certificates, or hardcoded cloud backend API keys.
* **Potential Impacts:** * **Local Network Compromise:** Stealing the homeowner's Wi-Fi password to pivot onto their private home network.
    * **Fleet-Wide Cloud Breach:** Using extracted master API keys to send unauthorized commands to *all* thermostats connected to the cloud provider.
    * **Property Damage:** Forcing the heating element to run indefinitely, risking physical burnout or frozen pipes.

---

## 3. Secure OTA (Over-The-Air) Update Process

To prevent malicious firmware updates from bricking devices or turning them into botnets, the OTA architecture must implement these essential controls:

1.  **Cryptographic Code Signing (Asymmetric Encryption):** * The manufacturer signs the firmware binary using a private key kept securely offline in a Hardware Security Module (HSM). 
    * The thermostat uses a hardcoded public key to verify the signature before unpacking the file.
2.  **Secure Boot:** * The hardware root-of-trust (stored in read-only bootloader memory) verifies the cryptographic signature of the operating system *every time* the device powers on, preventing altered firmware from running.
3.  **Anti-Rollback Protection (Version Interlocking):** * The device maintains a hardware-backed monotonic counter of the current version. It must reject older, signed firmware updates that contain known, patchable vulnerabilities.
4.  **Mutual Transport Layer Security (mTLS):** * The firmware download channel must use HTTPS where both the server verifies the device's unique certificate and the device verifies the update server's certificate.
5.  **Fail-Safe / Dual-Bank Partitioning:** * The device writes the new update to a secondary memory slot (Bank B) while running on Bank A. If the update fails integrity verification or crashes on boot, the watchdog timer automatically rolls back to the working Bank A partition.
