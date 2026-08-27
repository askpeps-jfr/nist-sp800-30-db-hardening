# nist-sp800-30-db-hardening
NIST SP 800-30 Rev. 1 Risk Assessment &amp; Cloud Database Hardening Suite
# NIST SP 800-30 Rev. 1 Vulnerability Assessment & Database Hardening

An enterprise-grade threat modeling and perimeter defense assessment for a publicly exposed cloud database server, structured in compliance with the **NIST SP 800-30 Rev. 1** risk management framework.

---

## 1. Executive Summary

* **Target System:** Linux-based remote MySQL database server (128GB RAM, IPv4).
* **Vulnerability:** Unauthenticated, unrestricted public internet access (`0.0.0.0/0:3306`) since deployment.
* **Core Business Impact:** Exposure of global customer records, campaign analytics, and prospective client datasets used by remote marketing teams.
* **Risk Outcome:** Prior to remediation, external data exfiltration carried a critical **Risk Score of 9 (High)**. Following defense-in-depth controls, risk is reduced to acceptable operational baselines.

---

## 2. NIST SP 800-30 Qualitative Risk Assessment Matrix

Risk is calculated using the qualitative scoring formula:
$$\text{Risk Score} = \text{Likelihood (1–3)} \times \text{Severity (1–3)}$$

| Threat Source | Threat Event | Likelihood (1–3) | Severity (1–3) | Initial Risk Score | Post-Remediation Risk |
| :--- | :--- | :---: | :---: | :---: | :---: |
| **Hacker (Outsider)** | Sensitive Information Exfiltration | 3 | 3 | **9 (High)** | **2 (Low)** |
| **Employee (Insider)** | Unauthorized Alteration / Data Deletion | 2 | 3 | **6 (Moderate)** | **2 (Low)** |
| **Competitor (Outsider)** | Denial of Service (DoS) Outage | 2 | 2 | **4 (Moderate)** | **1 (Low)** |

---

## 3. Defense-in-Depth Remediation Plan

### A. Perimeter & Network Layer
* **Firewall Ingress Restriction:** Block public exposure to TCP port `3306` via UFW. Restrict database traffic exclusively to the internal VPN pool (`10.8.0.0/24`).

### B. Transport & Data Layer
* **TLS 1.3 Enforcement:** Disable legacy SSL protocols and require encrypted client-server sessions.
* **Encryption at Rest:** Implement AES-256 tablespace encryption for sensitive customer tables.

### C. Identity & Access Management (IAM)
* **Principle of Least Privilege & RBAC:** Terminate root remote login capabilities; create granular read/write user roles.
* **Multi-Factor Authentication (MFA):** Enforce MFA gateways across all VPN entry points for remote employees.

---

## 4. Implementation Artifacts

### Perimeter Firewall Configuration (`configs/ufw-rules.sh`)
```bash
#!/usr/bin/env bash
# Perimeter Access Control Hardening Script
set -euo pipefail

# Block public access to database port
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow MySQL access exclusively through VPN gateway subnet
sudo ufw allow from 10.8.0.0/24 to any port 3306 proto tcp
sudo ufw --force enable

---

## 5. Verification & Compliance Controls

Run `tests/verify-controls.sh` to confirm proper interface binding and encrypted socket enforcement:

\`\`\`bash
chmod +x tests/verify-controls.sh
./tests/verify-controls.sh
\`\`\`

---
*Developed as part of the JFRsec Cybersecurity Portfolio Suite (Milestone 5: Assets, Threats & Vulnerabilities).*