#!/bin/sh
echo -en "$CONFIG" > /etc/unbound/unbound.conf.d/50-config.conf

## dnssec
unbound-anchor -a /etc/unbound/trusted-key.key

## start
chown -R nobody /etc/unbound
rm -f /var/run/unbound.pid

exec /usr/sbin/unbound \
  -d \
  -v \
  "$@" \
  -c /etc/unbound/unbound.conf
