FROM debian

RUN apt-get update -y && apt-get install -y libguestfs-tools

ENV LIBGUESTFS_DEBUG=1
ENV LIBGUESTFS_TRACE=1

ENTRYPOINT ["virt-make-fs"]
