FROM debian:bullseye-slim

# Required
RUN apt-get update -y && apt-get install -y \
      make \
      binutils \
      build-essential \
      g++ \
      patch \
      bzip2 \
      cpio \
      unzip \
      rsync \
      file \
      bc \
      wget \
      libncurses-dev \
      python \
      && mkdir -p /tmp/buildroot \
      && cd /tmp/buildroot \
      && wget https://buildroot.org/downloads/buildroot-2021.11.tar.xz \
      && tar -xf buildroot-2021.11.tar.xz -C /opt \
      && rm -rf /tmp/buildroot

WORKDIR /opt/buildroot-2021.11
