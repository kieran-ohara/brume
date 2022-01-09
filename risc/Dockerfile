FROM debian

ARG TOOLCHAIN="https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2021.11-1.tar.bz2"

RUN apt-get update -y && apt-get install -y curl bzip2 rsync \
      && mkdir /tmp/bootlin \
      && cd /tmp/bootlin \
      && curl -SL "${TOOLCHAIN}" -o download.tar.bz2 \
      && tar -xf download.tar.bz2 \
      && rsync --links -r riscv64-lp64d--glibc--stable-2021.11-1/ /
