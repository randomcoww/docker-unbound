#!/bin/sh
echo -en "$CONFIG" > /etc/unbound/unbound.conf.d/50-config.conf

## start
unbound-anchor || exit

rm -f /var/run/unbound.pid
exec /usr/sbin/unbound -d -c /etc/unbound/unbound.conf "$@"
