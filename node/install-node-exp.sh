#!/bin/bash

cat << EOF | tee node.yml
- hosts: 192.168.30.5
  roles:
    - node-exporter
EOF
