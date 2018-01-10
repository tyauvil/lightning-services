FROM golang:1.9 as BUILD

MAINTAINER Ty Auvil <ty.auvil@gmail.com>

# roasbeef fork that adds segwit
RUN go get -u -v github.com/roasbeef/btcd/...

FROM debian:9-slim

COPY --from=BUILD /go/bin/* /usr/local/bin/

RUN mkdir -p /data /rpc /var/log/btcd/mainnet /var/log/btcd/testnet /var/log/btcd/simnet /var/log/btcd/regtest &&\
    ln -sf /dev/null /var/log/btcd/mainnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/testnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/simnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/regtest/btcd.log

VOLUME ["/data", "/rpc"]

ENTRYPOINT [ "btcd", "--datadir=/data", "--logdir=/var/log/btcd/" ]
