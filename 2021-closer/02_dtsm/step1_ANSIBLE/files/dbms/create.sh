#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt -y update
apt -y install wget
apt -y install libaio1 libaio-dev lsb-release gnupg
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.11-1_all.deb
dpkg -i mysql-apt-config_0.8.11-1_all.deb
# not working :(
#debconf-set-selections <<< 'mysql-server mysql-server/root_password password ${ROOT_PASSWORD}'
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password ${ROOT_PASSWORD}'
apt -y install mysql-server
exit 0