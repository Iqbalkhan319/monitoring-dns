#!/bin/bash
sudo yum install rhel-system-roles -y
mkdir roles -p
cat << EOF | tee roles/role.yml
- name: node-exporter
  src: geerlingguy.node_exporter
EOF
ansible-galaxy install -r roles/role.yml -p .
