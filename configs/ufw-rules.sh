#!/usr/bin/env bash
# UFW Perimeter Firewall Configuration: MySQL Enclave Hardening
set -euo pipefail

# Reset UFW to default policies
ufw --force reset
ufw default deny incoming
ufw default allow outgoing

# Allow secure administrative SSH access
ufw allow 22/tcp

# Restrict MySQL port 3306 strictly to the trusted application subnet / VPN pool
ufw allow from 10.0.0.0/24 to any port 3306 proto tcp

# Enable firewall daemon
ufw --force enable
ufw status verbose