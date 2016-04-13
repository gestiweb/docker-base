#!/bin/bash
LOG_FILE=/var/log/container.log
# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-

# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE

# Redirect STDERR to STDOUT
exec 2>&1

. /lib/lsb/init-functions


SELF=$(cd $(dirname $0); pwd -P)/$(basename $0)
CONF=/etc/mysql/my.cnf
MYADMIN="/usr/bin/mysqladmin --defaults-file=/etc/mysql/debian.cnf"

# priority can be overriden and "-s" adds output to stderr
ERR_LOGGER="logger -p daemon.err -t /etc/init.d/mysql -i"

# Safeguard (relative paths, core dumps..)
cd /
umask 077
test -f /var/lib/mysql/debian-sys-maint.passwd && {
    pass2=$(cat /var/lib/mysql/debian-sys-maint.passwd)
    sed -i 's/password = .*$/password = '$pass2'/g' /etc/mysql/debian.cnf
}


# mysqladmin likes to read /root/.my.cnf. This is usually not what I want
# as many admins e.g. only store a password without a username there and
# so break my scripts.
export HOME=/etc/mysql/

# Could be removed during boot
test -e /var/run/mysqld || install -m 755 -o mysql -g root -d /var/run/mysqld
mysqld_get_param() {
  /usr/sbin/mysqld --print-defaults \
    | tr " " "\n" \
    | grep -- "--$1" \
    | tail -n 1 \
    | cut -d= -f2
}

mysqld_status () {
  ping_output=`$MYADMIN ping 2>&1`; ping_alive=$(( ! $? ))

  ps_alive=0
  pidfile=`mysqld_get_param pid-file`
  if [ -f "$pidfile" ] && ps `cat $pidfile` >/dev/null 2>&1; then ps_alive=1; fi

  if [ "$1" = "check_alive"  -a  $ping_alive = 1 ] ||
     [ "$1" = "check_dead"   -a  $ping_alive = 0  -a  $ps_alive = 0 ]; then
    return 0 # EXIT_SUCCESS
  else
    if [ "$2" = "warn" ]; then
      echo -e "$ps_alive processes alive and '$MYADMIN ping' resulted in\n$ping_output\n" | $ERR_LOGGER -p daemon.debug
    fi
  return 1 # EXIT_FAILURE
  fi
}



# Start MariaDB!
/usr/bin/mysqld_safe "${@:2}" &

for i in $(seq 1 300); do
          sleep 1
  if mysqld_status check_alive nowarn ; then break; fi
  log_progress_msg "."
done
if mysqld_status check_alive warn; then
  log_end_msg 0
  # Now start mysqlcheck or whatever the admin wants.
  output=$(/etc/mysql/debian-start)
  if [ -n "$output" ]; then
    log_action_msg "$output"
  fi
else
  log_end_msg 1
  log_failure_msg "Please take a look at the syslog"
fi


test -f /var/lib/mysql/root.passwd || {
    echo "Creating new passwords . . ."
    pwgen -1 24 > /var/lib/mysql/root.passwd
    pwgen -1 24 > /var/lib/mysql/debian-sys-maint.passwd
    pass1=$(cat /var/lib/mysql/root.passwd)
    pass2=$(cat /var/lib/mysql/debian-sys-maint.passwd)
    sed -i 's/password = .*$/password = '$pass2'/g' /etc/mysql/debian.cnf
    chmod og-rwx /var/lib/mysql/*.passwd

    mysql -u root -B <<HEREDOC--HEREDOC
UPDATE mysql.user SET Password = PASSWORD('$pass1') WHERE User = 'root';
UPDATE mysql.user SET Password = PASSWORD('$pass2') WHERE User = 'debian-sys-maint';
FLUSH PRIVILEGES;
HEREDOC--HEREDOC
    echo "done."
}


wait
