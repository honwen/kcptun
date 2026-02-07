FROM golang:1.25.7-bookworm
LABEL MAINTAINER="honwen<https://github.com/honwen>"
LABEL org.opencontainers.image.source="https://github.com/honwen/kcptun"
ENV CGO_ENABLED=0

WORKDIR /build

ADD . .

RUN set -x && \
	go mod download -x && \
	go build -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" -o /kcpc ./cmd/kcpc && \
	go build -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" -o /kcps ./cmd/kcpc

# FROM alpine
# RUN apk add --no-cache iptables
# COPY --from=builder /kcpc /bin
# COPY --from=builder /kcps /bin
# EXPOSE 29900/udp
# EXPOSE 12948
