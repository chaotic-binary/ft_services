# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jeldora <jeldora@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 15:42:32 by monie             #+#    #+#              #
#    Updated: 2020/10/12 16:28:10 by jeldora          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.0

RUN 	apk update && \
		apk upgrade && \
		apk add openrc 

WORKDIR /srcs

RUN		apk add nginx && \
		apk add openssl && \
		apk add openssh && \
		apk add supervisor

RUN		adduser -D 'user'; echo "user:12345" | chpasswd; \
		adduser -D -g 'www' www; mkdir /www; \
		chown -R www:www /var/lib/nginx; \
		chown -R www:www /www;

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=jeldora' \
		-keyout /etc/ssl/localhost.key \
		-out /etc/ssl/localhost.crt

COPY 	./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	./srcs/index.html /www
COPY 	./srcs/supervisord.conf /etc/supervisord.conf

COPY 	./srcs/start.sh start.sh

RUN 	chmod 711 start.sh

EXPOSE	80 443 22

CMD		["sh", "start.sh"]
