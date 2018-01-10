FROM golang:1.9 as BUILD

MAINTAINER Olaoluwa Osuntokun <laolu@lightning.network>

# Grab and install the latest version of roasbeef's fork of btcd and all
# related dependencies.
RUN go get -u -v github.com/roasbeef/btcd/...

FROM debian:9-slim

# Expose mainnet ports (server, rpc)
EXPOSE 8333 8334

# Expose testnet ports (server, rpc)
EXPOSE 18333 18334

# Expose simnet ports (server, rpc)
EXPOSE 18555 18556

# Expose segnet ports (server, rpc)
EXPOSE 28901 28902

RUN mkdir /data /rpc &&\
    ln -s /dev/null /data/btcd.log

VOLUME ["/data", "/rpc"]

COPY --from=BUILD /go/bin/* /usr/local/bin/

RUN mkdir -p /var/log/btcd/mainnet /var/log/btcd/testnet /var/log/btcd/simnet /var/log/btcd/regtest &&\
    ln -sf /dev/null /var/log/btcd/mainnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/testnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/simnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/regtest/btcd.log

ENTRYPOINT [ "btcd", "--datadir=/data", "--logdir=/var/log/btcd/" ]
