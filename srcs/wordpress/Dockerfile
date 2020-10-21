FROM	alpine:latest

RUN		apk update && apk add wget && \
		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib  php7-json\
		php7-curl php7-mbstring php7-json php7-session

RUN		wget https://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz -C /etc/ && \
		rm -rf latest.tar.gz

COPY	./wp-config.php /etc/wordpress

COPY	start.sh ./start.sh
RUN		chmod +x ./start.sh

EXPOSE	5050

ENTRYPOINT	[ "sh", "start.sh" ]
