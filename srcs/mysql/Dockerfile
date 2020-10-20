FROM	alpine:latest

RUN		apk update && \
		apk add mysql mysql-client openrc && \
		apk add --no-cache --upgrade bash && rm -rf /var/cache/apk/*

RUN		mkdir -p /run/mysqld

COPY	start.sh /tmp/
RUN		chmod +x /tmp/start.sh
COPY	setup_db /tmp/
COPY	./wordpress.sql /tmp/
COPY	./my.cnf /etc/mysql/

EXPOSE	3306
VOLUME	["/var/lib/mysql"]

ENTRYPOINT	["/tmp/start.sh"]
