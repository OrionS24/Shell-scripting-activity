bash

#!/bin/bash

VAULT="$HOME/secure_vault"

while true; do
echo "----- Secure Vault Menu -----"
echo "1. Add Secret"
echo "2. Update Secret"
echo "3. Add Log Entry"
echo "4. Access Keys"
echo "5. Exit"

read -p "Choose an option: " option

case $option in 
1)
         read -p "Enter new secret: " secret
      echo "$secret" >> "$VAULT/secrets.txt"
      ;;
    2)
      read -p "Enter text to replace: " old
      read -p "Enter new text: " new
      if grep -q "$old" "$VAULT/secrets.txt"; then
        sed -i "s/$old/$new/g" "$VAULT/secrets.txt"
      else
        echo "No match found."
      fi
      ;;
    3)
      echo "$(date): Log entry added" >> "$VAULT/logs.txt"
      ;;
    4)
      echo "ACCESS DENIED "
       ;;
    5)
      exit 0
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done
