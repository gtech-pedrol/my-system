FROM quay.io/fedora/fedora-silverblue:42

# Define o rootfs padrão para instalação
RUN printf '[install.filesystem.root]\ntype = "xfs"\n' \
    > /usr/lib/bootc/install/00-rootfs.toml

# Copia e executa o script de build
COPY build_files/build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh

# Verifica a imagem
RUN bootc container lint
