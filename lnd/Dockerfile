FROM golang:1.9 as BUILD

WORKDIR /go/src/github.com/lightningnetwork/lnd

RUN go get -u github.com/Masterminds/glide
RUN git clone https://github.com/lightningnetwork/lnd /go/src/github.com/lightningnetwork/lnd
RUN glide install
RUN go install . ./cmd/...

FROM debian:9-slim

EXPOSE 9735 8080 10009

RUN mkdir /data /rpc &&\
    ln -s /dev/null /data/lnd.log

VOLUME ["/data", "/rpc"]

COPY --from=BUILD /go/bin/* /usr/bin/

ENTRYPOINT [ "lnd", "--datadir=/data" ]
