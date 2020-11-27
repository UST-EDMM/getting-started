#!/bin/bash

function check () {
  echo "Check if "$1" is available"
  if ! [[ -x "$(command -v "$1")" ]]; then
    echo "INFO: "$1" is not installed" >&2
    return 1
  fi
}
sed -i 's/bind-address/\#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
check systemctl
if [[ $? -eq 0 ]]; then
    systemctl daemon-reload
    systemctl enable mysql
    systemctl restart mysql
else
    echo "INFO: Starting MySQL daemon in foreground"
    mysqld
fi
exit 0
