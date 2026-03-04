#!/bin/bash

set -ouex pipefail

# Fix for /opt being a symlink, which breaks some RPM installations (like Mullvad)
if [ -L /opt ]; then
    rm -f /opt
    mkdir /opt
fi

### Mullvad VPN Installation
cat <<EOF > /etc/yum.repos.d/mullvad.repo
[mullvad]
name=Mullvad VPN
baseurl=https://repository.mullvad.net/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://repository.mullvad.net/rpm/mullvad-keyring.asc
EOF

# Install system packages
dnf5 install -y mullvad-vpn mullvad-browser fastfetch tmux btop python3-pip python3-i3ipc

# Install autotiling via pip (since COPR doesn't have F43 yet)
pip install --prefix=/usr autotiling

#### Example for enabling a System Unit File
systemctl enable podman.socket
