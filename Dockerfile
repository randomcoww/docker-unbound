FROM alpine:latest

ENV ROOT_HINTS_URL https://www.internic.net/domain/named.cache

RUN set -x \
  \
  && apk add --no-cache unbound

COPY unbound.conf /etc/unbound/unbound.conf
ADD $ROOT_HINTS_URL /etc/unbound/root.hints

RUN set -x \
  \
  && mkdir -p \
    /etc/unbound/unbound.conf.d \
  && chmod +r \
    /etc/unbound/unbound.conf \
    /etc/unbound/root.hints

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
