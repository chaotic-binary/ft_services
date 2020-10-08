FROM alpine:latest

# packages
RUN apk update \
&& apk add openrc --no-cache \
&& apk add openssh \
&& apk add openssl \
&& apk add nginx

RUN mkdir -p /www/

#nginx
RUN apt-get install nginx -y
RUN rm /etc/nginx/sites-enabled/default
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#SSL
#RUN apt-get -y install openssl
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=ttamesha"


COPY ./srcs/start.sh ./
#COPY ./srcs/autoindex.sh ./

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 777 /var/*

EXPOSE 80 443

CMD bash ./start.sh
