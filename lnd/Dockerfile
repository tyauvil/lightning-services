FROM golang:1.9 as BUILD

ENV CGO_ENABLED=0

RUN go get -u -v github.com/lightningnetwork/lnd/...

FROM alpine

EXPOSE 9735 8080 10009

RUN mkdir /data /rpc &&\
    ln -s /dev/null /data/lnd.log

VOLUME ["/data", "/rpc"]

COPY --from=BUILD /go/bin/* /usr/local/bin/

ENTRYPOINT [ "lnd", "--configfile=/data/lnd.conf", "--datadir=/data" ]

