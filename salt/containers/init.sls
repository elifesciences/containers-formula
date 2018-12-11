credentials-environment-variables:
    file.managed:
        - name: /etc/profile.d/vault
        - contents: |
            export VAULT_ADDR={{ pillar.containers.vault.addr }}

credentials-setup:
    file.managed:
        - name: /usr/local/bin/credentials-setup.sh
        - source: salt://containers/config/usr-local-bin-credentials-setup.sh
        #- mode: 755
