#!/bin/bash

set -ouex pipefail

# Fix for /opt being a symlink, which breaks some RPM installations (like Mullvad)
if [ -L /opt ]; then
    rm -f /opt
    mkdir /opt
fi

### Mullvad VPN Installation
# Create repo file directly to avoid config-manager issues
cat <<EOF > /etc/yum.repos.d/mullvad.repo
[mullvad]
name=Mullvad VPN
baseurl=https://repository.mullvad.net/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://repository.mullvad.net/rpm/mullvad-keyring.asc
EOF

# Install the package
dnf5 install -y mullvad-vpn

### Install other packages
dnf5 install -y fastfetch tmux

#### Example for enabling a System Unit File
systemctl enable podman.socket
