containers:
    vault:
        addr: https://master-server.elifesciences.org:8200
        role_id: 00000000-0000-0000-0000-000000000000

elife:
    aws:
        access_key_id: AKIAFAKE
        secret_access_key: fake
    ssh_credentials:
        ubuntu:
            username: ubuntu
            home: /home/ubuntu
            private_key: salt://elife/ssh-credentials/sample.id_rsa
    kubectl:
        username: ubuntu
    helm:
        username: ubuntu

