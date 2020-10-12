FROM alpine:latest

# packages
RUN apk update \
&& apk add openrc --no-cache \
&& apk add openssh \
&& apk add openssl \
&& apk add supervisor \
&& apk add nginx

RUN mkdir -p /www/

#nginx
COPY ./nginx.conf /etc/nginx/conf.d/deafult.conf
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=ttamesha"
RUN adduser -D 'user' ; echo 'user:1234' | chpasswd;

COPY ./srcs/start.sh ./

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 777 /var/*

EXPOSE 80 443 22

CMD ["sh", "./start.sh"]
