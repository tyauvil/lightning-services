FROM debian:9 as BUILD

ENV DEBIAN_FRONTEND=noninteractive
ENV TAG=master

RUN mkdir -p /build /package/usr/bin /package/etc/lightning /package/usr/lib/systemd/system
RUN apt-get update
RUN apt-get install -y autoconf build-essential git libtool libgmp-dev libsqlite3-dev python python3 net-tools
RUN cd /build &&\
    git clone https://github.com/ElementsProject/lightning.git &&\
    git checkout ${TAG} &&\
    cd lightning &&\
    make &&\
