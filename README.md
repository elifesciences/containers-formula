# `containers` formula

This repository contains instructions for installing and configuring the `containers` project, a barebones VM capable of running `docker` and `docker-compose`.

This repository should be structured as any Saltstack formula should, but it 
should also conform to the structure required by the [builder](https://github.com/elifesciences/builder) 
project.

[MIT licensed](LICENCE.txt)

## AMI usage

This project is used to maintain a `containers--jenkins-plugin-ami` EC2 instance that is [snapshotted to produce AMIs](https://alfred.elifesciences.org/job/process/job/process-ec2-plugin-ami-update/) used by Jenkins to dynamically create nodes. It is almost never used to create ad-hoc or environment-based EC2 instances apart from testing.

The AMI stores [parameters](https://github.com/elifesciences/builder/blob/master/projects/elife.yaml#L1134-L1138) such as the disk size and type, that hence have to be configured on this instance rather than in Jenkins.

Producing an AMI strips secrets from the instance to favor portability of the image and avoid long-term secrets storage, Hence the template contains a [setup-secrets.sh](salt/containers/config/usr-local-bin-setup-secrets.sh) script used by [Jenkins EC2 plugin](https://alfred.elifesciences.org/configure) to access Vault on initialization and pull secrets such as an SSH key on the local filesystem.

## Vault

The `setup-secrets.sh` script authenticates with Vault using the [`AppRole`](https://www.vaultproject.io/docs/auth/approle.html) auth method, with the credentials `VAULT_ROLE_ID` (kind of username) and `VAULT_SECRET_ID` (kind of password) being used to issue a temporary `VAULT_TOKEN` that can be used to retrieve secrets.
