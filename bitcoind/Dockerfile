FROM debian:9-slim

ARG BITCOIN_VERSION=0.15.1
ENV BUILD_PACKAGES="curl gpg ca-certificates"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install ${BUILD_PACKAGES} &&\
    cd /tmp &&\
    curl -SL https://bitcoincore.org/keys/laanwj-releases.asc | gpg --import &&\
    curl -SLO https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS.asc &&\
    curl -SLO https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz &&\
    gpg --verify SHA256SUMS.asc &&\
    grep " bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz\$" SHA256SUMS.asc | sha256sum -c - &&\
    tar xf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz &&\
    mv /tmp/bitcoin-${BITCOIN_VERSION}/bin/bitcoind /usr/local/bin/ &&\
    apt-get -y purge ${BUILD_PACKAGES} &&\
    apt-get -y autoremove &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

EXPOSE 8332 8333 18332 18333

VOLUME ["/data"]

ENTRYPOINT ["bitcoind", "-printtoconsole"]
