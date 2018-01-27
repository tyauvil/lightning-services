FROM debian:9 as BUILD

ENV DEBIAN_FRONTEND=noninteractive
ARG TAG=master

RUN mkdir /build
RUN apt-get update
RUN apt-get install -y autoconf build-essential git libtool libgmp-dev libsqlite3-dev python python3 net-tools
RUN cd /build &&\
    git clone https://github.com/ElementsProject/lightning.git &&\
    git checkout ${TAG} &&\
    cd lightning &&\
    make

FROM debian:9-slim

COPY --from=BUILD /build/lightning/lightningd/lightning_* /usr/bin/
COPY --from=BUILD /build/lightning/lightningd/lightningd /usr/bin/
COPY --from=BUILD /build/lightning/cli/lightning-cli /usr/bin/

VOLUME [ "/data" ]

ENTRYPOINT [ "lightningd" ]
