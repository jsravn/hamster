#!/usr/bin/bash -e

ansible-playbook --vault-password-file=.hamster-vault-pass -v -i inventory playbook.yml $@
