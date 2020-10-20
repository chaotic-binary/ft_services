#!/bin/sh

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < /tmp/setup_db
mysql < /tmp/wordpress.sql
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
