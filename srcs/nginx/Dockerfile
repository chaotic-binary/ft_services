FROM	alpine:latest

RUN 	apk update && \
		apk upgrade && \
		apk add openrc && \
		apk add nginx && \
		apk add openssl && \
		apk add openssh && \
		apk add supervisor

VOLUME	[ "/sys/fs/cgroup" ]

RUN		mkdir /www /run/nginx /run/sshd;

RUN		adduser -D 'user'; echo "user:password" | chpasswd; \
		adduser -D -g 'www' www;  \
		chown -R www:www /var/lib/nginx; \
		chown -R www:www /www;
RUN		/usr/bin/ssh-keygen -A

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=ttamesha" \
		-keyout /etc/ssl/localhost.key \
		-out /etc/ssl/localhost.crt

COPY	./nginx.conf /etc/nginx/conf.d/default.conf
COPY	./index.html /www
COPY	./supervisord.conf /etc/supervisord.conf

COPY	./start.sh /tmp/start.sh

RUN		chmod u+x /tmp/start.sh
RUN		chmod 744 /run/nginx
RUN		chmod 744 /run/sshd

EXPOSE	80 443 22

CMD		["sh", "/tmp/start.sh"]
