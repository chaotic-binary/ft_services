FROM alpine:latest

RUN	apk update && apk add wget && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

RUN	mkdir /www

RUN	wget https://wordpress.org/latest.tar.gz && \
	tar xzf latest.tar.gz && \
	mv wordpress /www/ && \
	rm ./latest.tar.gz

COPY	./wp-config.php /www/wordpress

COPY	start.sh ./start.sh
RUN		chmod +x ./start.sh

EXPOSE	5050

ENTRYPOINT [ "sh", "start.sh"]
