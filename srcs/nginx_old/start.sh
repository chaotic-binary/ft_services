#!/bin/sh
rc default
# rc-service nginx start
# rc-service nginx stop
mkdir /run/nginx
mkdir /run/sshd
chmod 744 /run/nginx
chmod 744 /run/sshd
rc-service sshd start
ssh-keygen -A
rc-service sshd stop
/usr/bin/supervisord -c /etc/supervisord.conf
