FROM quay.io/fedora/fedora-silverblue:42

# Define o rootfs padrão para instalação
RUN printf '[install.filesystem.root]\ntype = "xfs"\n' \
    > /usr/lib/bootc/install/00-rootfs.toml

RUN dnf5 install -y fastfetch && dnf5 clean all

RUN bootc container lint
