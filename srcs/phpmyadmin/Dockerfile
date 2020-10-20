FROM alpine:latest

RUN	apk update && apk add wget && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.3/phpMyAdmin-5.0.3-all-languages.tar.gz && \
	tar xzf phpMyAdmin-5.0.3-all-languages.tar.gz && \
	rm ./phpMyAdmin-5.0.3-all-languages.tar.gz && \
	mv phpMyAdmin-5.0.3-all-languages /etc/phpmyadmin

COPY	./start.sh /tmp/start.sh
RUN		chmod +x /tmp/start.sh
COPY	./config.inc.php /etc/phpmyadmin/config.inc.php

EXPOSE 5050

CMD ["/tmp/start.sh"]
