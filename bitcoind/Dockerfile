FROM debian:9-slim

ARG BITCOIN_VERSION=0.15.1
ENV BUILD_PACKAGES="wget ca-certificates"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install ${BUILD_PACKAGES} &&\
    cd /tmp &&\
    wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz &&\
    tar xf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz &&\
    mv /tmp/bitcoin-${BITCOIN_VERSION}/bin/bitcoind /usr/local/bin/ &&\
    mv /tmp/bitcoin-${BITCOIN_VERSION}/bin/bitcoin-cli /usr/local/bin/ &&\
    mv /tmp/bitcoin-${BITCOIN_VERSION}/bin/bitcoin-tx /usr/local/bin/ &&\
    apt-get -y purge ${BUILD_PACKAGES} &&\
    apt-get -y autoremove &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

VOLUME ["/data"]

ENTRYPOINT ["bitcoind", "--printtoconsole"]
