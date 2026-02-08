bash
#!/bin/bash
mkdir -p "$HOME/secure_vault"
echo "Welcome to the Keys Vault" > "$HOME/secure_vault/keys.txt"
echo "Welcome to the Secrets Vault" > "$HOME/secure_vault/secrets.txt"
echo "Welcome to the Logs Vault" > "$HOME/secure_vault/logs.txt"
echo "Secure Vault setup completed successfully"
ls -l "$HOME/secure_vault"
