bash
#!/bin/bash
VAULT="$HOME/secure_vault"
if [ ! -d "$VAULT" ]; then
echo "Error: secure_vault does not exist"
exit 1
fi
update_permission() {
file=$1
default_perm=$2

echo "Current permission for $file:"
ls -l "$VAULT/$file"
read -p "Do you want to udate permission? (yes/no): " choice

if[ "$choice" = "yes" ]; then
read -p "Enter new permission (e.g. 600): " perm
chmod "$default_perm" "$VAULT/$file"
fi
}

update_permission "keys.txt" 600
update_permission "secrets.txt" 640
update_permission "logs.txt" 644

echo "Final permissions:"
ls -l "$VAULT"
