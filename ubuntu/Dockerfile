FROM debian

RUN apt-get update -y && apt-get install -y libguestfs-tools

ENTRYPOINT ["virt-make-fs"]
