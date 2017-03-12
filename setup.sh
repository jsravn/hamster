#!/usr/bin/bash -e

ansible-playbook -v -i inventory playbook.yml $@
