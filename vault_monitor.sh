#!/bin/bash

VAULT="$HOME/secure_vault"
REPORT="$VAULT/vault_report.txt"

> "$REPORT"

for file in "$VAULT"/*; do
  perms=$(stat -c "%a" "$file")

  echo "File: $(basename "$file")" >> "$REPORT"
  echo "Size: $(stat -c "%s" "$file") bytes" >> "$REPORT"
  echo "Last Modified: $(stat -c "%y" "$file")" >> "$REPORT"
  echo "Permissions: $perms" >> "$REPORT"

  if [ "$perms" -gt 644 ]; then
    echo " SECURITY RISK DETECTED" >> "$REPORT"
  fi

  echo "------------------------" >> "$REPORT"
done

echo "Vault report created successfully "
