#!/bin/bash
set -e
# needs the following environment variables:
#VAULT_ADDR
#VAULT_ROLE_ID
#VAULT_SECRET_ID

# login
VAULT_TOKEN="$(vault write -field=token auth/approle/login role_id="$VAULT_ROLE_ID" secret_id="$VAULT_SECRET_ID")"

# SSH credentials
rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
vault kv get -format=json secret/containers/ssh | jq -r .data.private_key > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
