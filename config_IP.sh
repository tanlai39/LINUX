cat > /etc/netplan/tanlv.yaml <<'EOF'
network:
  version: 2
  ethernets:
    ens192:
      dhcp4: false
      dhcp6: false
      addresses:
        - 10.0.0.250/24
      routes:
        - to: default
          via: 10.0.0.1
      nameservers:
        search:
          - tanlv.local
        addresses:
          - 8.8.8.8
EOF
