# Modified from https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile
FROM debian:buster-slim

RUN apt-get clean && apt-get update -y && apt-get install -y \
      git bc sshfs bison flex libssl-dev make kmod libc6-dev libncurses5-dev \
      crossbuild-essential-armhf \
      crossbuild-essential-arm64

ENV ARCH=arm64

RUN mkdir /build
WORKDIR /build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
