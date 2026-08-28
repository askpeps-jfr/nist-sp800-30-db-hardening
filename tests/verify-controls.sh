#!/usr/bin/env bash
# NIST SP 800-30 Technical Control Verification
set -euo pipefail

echo "=== Verifying Database Perimeter & Port Exposure ==="
if ss -tuln | grep -q ":3306.*0.0.0.0"; then
    echo "[FAIL] MySQL is listening on all public interfaces (0.0.0.0:3306)!"
    exit 1
else
    echo "[PASS] MySQL is strictly bound to internal interface."
fi

echo "=== Verifying UFW Status ==="
if ufw status | grep -q "Status: active"; then
    echo "[PASS] UFW perimeter enforcement active."
else
    echo "[FAIL] UFW is inactive!"
    exit 1
fi