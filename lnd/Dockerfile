FROM debian:9 as BUILD

ARG RELEASE="v0.4.2-beta"
ENV URL="https://github.com/lightningnetwork/lnd/releases/download/$RELEASE"
WORKDIR /tmp

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    git gnupg curl ca-certificates
RUN curl -LO "$URL/lnd-linux-amd64-$RELEASE.tar.gz"
RUN curl -LO "$URL/manifest-$RELEASE.txt"
RUN curl -LO "$URL/manifest-$RELEASE.txt.sig"
RUN curl https://keybase.io/roasbeef/pgp_keys.asc | gpg --import
RUN gpg --verify manifest-v0.4.2-beta.txt.sig
RUN grep "lnd-linux-amd64-$RELEASE.tar.gz" "manifest-$RELEASE.txt" | sha256sum -c -
RUN tar xf "lnd-linux-amd64-$RELEASE.tar.gz" --strip-components=1

FROM debian:9-slim

EXPOSE 9735 8080 10009

RUN mkdir /data /rpc &&\
    ln -s /dev/null /data/lnd.log

VOLUME ["/data", "/rpc"]

COPY --from=BUILD /tmp/lncli /usr/local/bin/
COPY --from=BUILD /tmp/lnd /usr/local/bin/

ENTRYPOINT [ "lnd", "--datadir=/data" ]
