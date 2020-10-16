# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ttamesha <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/01 13:55:37 by kwillum           #+#    #+#              #
#    Updated: 2020/10/16 23:06:24 by ttamesha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update
RUN		apk add mysql mysql-client
RUN 	apk add --no-cache --upgrade bash && rm -rf /var/cache/apk/*
RUN 	apk add openrc
RUN 	mkdir -p /run/mysqld
COPY	start.sh /tmp/
RUN		chmod +x /tmp/start.sh
COPY	setup_db /tmp/
COPY 	./wordpress.sql /tmp/wordpress.sql
COPY 	./my.cnf /etc/mysql/

EXPOSE	3306
VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/tmp/start.sh"]
