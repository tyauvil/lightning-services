FROM golang:1.10 as BUILD

MAINTAINER Ty Auvil <ty.auvil@gmail.com>

ARG BRANCH=master
WORKDIR /go/src/github.com/btcsuite/btcd

RUN go get -u github.com/Masterminds/glide
RUN git clone https://github.com/btcsuite/btcd /go/src/github.com/btcsuite/btcd
RUN git checkout "$BRANCH"
RUN glide install
RUN go install . ./cmd/...

FROM debian:9-slim

COPY --from=BUILD /go/bin/* /usr/local/bin/

RUN mkdir -p /data /rpc /var/log/btcd/mainnet /var/log/btcd/testnet /var/log/btcd/simnet /var/log/btcd/regtest &&\
    ln -sf /dev/null /var/log/btcd/mainnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/testnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/simnet/btcd.log &&\
    ln -sf /dev/null /var/log/btcd/regtest/btcd.log

VOLUME ["/data", "/rpc"]

ENTRYPOINT [ "btcd", "--datadir=/data", "--logdir=/var/log/btcd/" ]
