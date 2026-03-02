FROM scratch AS ctx
COPY build_files /

# Base Image - Fedora Silverblue oficial
FROM quay.io/fedora/fedora-silverblue:42

### MODIFICATIONS
RUN --mount=type=cache,dst=/var/cache/libdnf5 \
    dnf5 install -y fastfetch && \
    dnf5 clean all

### LINTING
RUN bootc container lint
