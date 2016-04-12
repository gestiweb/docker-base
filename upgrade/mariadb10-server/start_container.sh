#!/bin/bash

. /lib/lsb/init-functions

SELF=$(cd $(dirname $0); pwd -P)/$(basename $0)
CONF=/etc/mysql/my.cnf
MYADMIN="/usr/bin/mysqladmin --defaults-file=/etc/mysql/debian.cnf"
ERR_LOGGER="logger -p daemon.err -t /etc/init.d/mysql -i"

# Safeguard (relative paths, core dumps..)
cd /
umask 077

# mysqladmin likes to read /root/.my.cnf. This is usually not what I want
# as many admins e.g. only store a password without a username there and
# so break my scripts.
export HOME=/etc/mysql/

## Fetch a particular option from mysql's invocation.
#
# Usage: void mysqld_get_param option
mysqld_get_param() {
  /usr/sbin/mysqld --print-defaults \
    | tr " " "\n" \
    | grep -- "--$1" \
    | tail -n 1 \
    | cut -d= -f2
}

## Do some sanity checks before even trying to start mysqld.
sanity_checks() {
  # check for config file
  if [ ! -r /etc/mysql/my.cnf ]; then
    log_warning_msg "$0: WARNING: /etc/mysql/my.cnf cannot be read. See README.Debian.gz"
    echo                "WARNING: /etc/mysql/my.cnf cannot be read. See README.Debian.gz" | $ERR_LOGGER
  fi

  # check for diskspace shortage
  datadir=`mysqld_get_param datadir`
  if LC_ALL=C BLOCKSIZE= df --portability $datadir/. | tail -n 1 | awk '{ exit ($4>4096) }'; then
    log_failure_msg "$0: ERROR: The partition with $datadir is too full!"
    echo                "ERROR: The partition with $datadir is too full!" | $ERR_LOGGER
    exit 1
  fi
}

sanity_checks;
# Start daemon
log_daemon_msg "Starting MariaDB database server" "mysqld"

# Could be removed during boot
test -e /var/run/mysqld || install -m 755 -o mysql -g root -d /var/run/mysqld

# Start MariaDB!
/usr/bin/mysqld_safe "${@:2}" 2>&1 >/dev/null | $ERR_LOGGER


