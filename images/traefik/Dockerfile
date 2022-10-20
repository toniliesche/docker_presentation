FROM alpine:3.16

RUN apk add git && \
  git clone https://github.com/signalsciences/tlstext /tmp/tlstext && \
  cd /tmp/tlstext && git checkout v1.3.0 && \
  git clone https://github.com/satori/go.uuid /tmp/go.uuid && \
  cd /tmp/go.uuid && git checkout v1.2.0

FROM traefik:2.9
LABEL org.opencontainers.image.authors="docker@toniliesche.de"

COPY files/plugins-local /plugins-local
COPY --from=0 /tmp/tlstext /plugins-local/src/github.com/signalsciences/tlstext
COPY --from=0 /tmp/go.uuid /plugins-local/src/github.com/satori/go.uuid

RUN ln -s /dev/stdout /var/log/traefik-access.log
