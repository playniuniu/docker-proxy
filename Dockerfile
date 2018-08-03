FROM golang:alpine as builder
RUN apk add --update --no-cache git upx \
    && cd /go/src/ \
    && git clone https://github.com/snail007/goproxy \
    && cd goproxy \
    && go get \
    && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o goproxy \
    && upx goproxy

FROM alpine:latest
COPY --from=builder /go/src/goproxy/goproxy /usr/local/bin/goproxy
CMD goproxy ${OPTS}