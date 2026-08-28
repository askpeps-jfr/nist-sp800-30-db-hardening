# NIST SP 800-30 Database Hardening & Quantitative Risk Assessment

A quantitative risk assessment and database security remediation project aligned with **NIST SP 800-30 Rev. 1 (Guide for Conducting Risk Assessments)** and **NIST SP 800-53 Technical Controls**.

---

## 1. Executive Summary

* **Target System:** Production Linux / MySQL Database Enclave (TCP port 3306) hosting customer and sales analytics data.
* **Identified Vulnerabilities:** Unrestricted public internet access, default administrative credentials, excessive wildcard privileges, and unencrypted transport.
* **Risk Calculation Model:** $\text{Risk Score} = (\text{Likelihood} \times \text{Impact}) - \text{Mitigating Controls}$
* **Remediation Result:** Reduced baseline risk from **Critical (25/25)** down to **Secure (1/25)** across all perimeter, authentication, and encryption vectors.

---

## 2. NIST SP 800-30 9-Step Assessment Execution

| Step | Assessment Phase | Target Implementation |
| :---: | :--- | :--- |
| **1** | System Characterization | Remote Linux / MySQL server hosting sensitive customer analytics. |
| **2** | Threat Identification | External unauthorized access, credential stuffing, and packet sniffing. |
| **3** | Vulnerability Identification | Direct public exposure to the WAN, legacy TLS defaults, missing MFA. |
| **4** | Likelihood Determination | Rated **5 (Very High)** due to open unauthenticated endpoints. |
| **5** | Impact Analysis | Rated **5 (Catastrophic)** due to direct database exposure and SPII loss. |
| **6** | Risk Determination | Baseline score evaluated at **25 (Maximum Critical Risk)**. |
| **7** | Control Recommendations | Enforce VPN perimeter, Least Privilege RBAC, TLS 1.3, and SIEM logging. |
| **8** | Results Documentation | Formal Vulnerability Assessment Report (VAR) and remediation plan. |

---

## 3. Interactive Risk Calculator Sandbox & Repository

This repository includes **RiskMatrix 800-30**, an interactive client-side calculator modeling real-time quantitative risk scores and NIST SP 800-53 technical controls.

* **Live Interactive Demo:** [Launch RiskMatrix 800-30](https://askpeps-jfr.github.io/nist-sp800-30-db-hardening/app/)
* **Project Repository:** [nist-sp800-30-db-hardening on GitHub](https://github.com/askpeps-jfr/nist-sp800-30-db-hardening)
* **Application Source Code:** [`app/index.html`](https://github.com/askpeps-jfr/nist-sp800-30-db-hardening/blob/main/app/index.html)

*Developed as part of the JFRsec Cybersecurity Portfolio Suite (Course 5: Assets, Threats, and Vulnerabilities).*