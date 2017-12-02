FROM alpine:latest

RUN \
  apk add --no-cache unbound && \
  mkdir /etc/unbound/unbound.conf.d

COPY unbound.conf /etc/unbound/unbound.conf
ADD https://www.internic.net/domain/named.cache /etc/unbound/root.hints

RUN \
  chmod +r \
  /etc/unbound/unbound.conf \
  /etc/unbound/root.hints

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
