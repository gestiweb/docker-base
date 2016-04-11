#!/bin/bash

PATH=/sbin:/usr/sbin:/bin:/usr/bin
NAME=php5-fpm
DAEMON=/usr/sbin/$NAME
DAEMON_ARGS="--fpm-config /etc/php5/fpm/php-fpm.conf"
CONF_PIDFILE=$(sed -n 's/^pid\s*=\s*//p' /etc/php5/fpm/php-fpm.conf)
PIDFILE=${CONF_PIDFILE:-/run/php5-fpm.pid}

# Read configuration variable file if it is present
[ -r /etc/default/$NAME ] && . /etc/default/$NAME

# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions


$DAEMON $DAEMON_ARGS


sleep 900

