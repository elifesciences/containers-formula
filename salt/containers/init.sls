credentials-environment-variables:
    file.managed:
        - name: /etc/profile.d/vault.sh
        - contents: |
            export VAULT_ADDR={{ pillar.containers.vault.addr }}
            export VAULT_ROLE_ID={{ pillar.containers.vault.role_id }}

credentials-initial-setup:
    file.managed:
        - name: /usr/local/bin/setup-secrets.sh
        - source: salt://containers/config/usr-local-bin-setup-secrets.sh
        - mode: 755

credentials-on-demand:
    file.managed:
        - name: /usr/local/bin/vault.sh
        - source: salt://containers/config/usr-local-bin-vault.sh
        - mode: 755
