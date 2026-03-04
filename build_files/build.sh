#!/bin/bash

set -ouex pipefail

### Mullvad VPN Installation
# Add the Mullvad repository server to dnf
dnf5 config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# Install the package
dnf5 install -y mullvad-vpn

### Install other packages
dnf5 install -y fastfetch tmux

#### Example for enabling a System Unit File
systemctl enable podman.socket
