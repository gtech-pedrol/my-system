FROM ghcr.io/ublue-os/base-main:stable

# Define o rootfs padrão para instalação
RUN mkdir -p /usr/lib/bootc/install/ && \
    printf '[install.filesystem.root]\ntype = "xfs"\n' \
    > /usr/lib/bootc/install/00-rootfs.toml

# Copia o script de build
COPY build_files/build.sh /tmp/build.sh

# Dá permissão e executa o script
RUN chmod +x /tmp/build.sh && \
    /tmp/build.sh && \
    rm /tmp/build.sh

# Verifica a imagem
RUN bootc container lint
