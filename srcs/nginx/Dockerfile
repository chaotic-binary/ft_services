FROM alpine:latest

# packages
RUN apk update \
&& apk add openrc --no-cache \
&& apk add openssh \
&& apk add openssl \
&& apk add supervisor \
&& apk add nginx

#RUN mkdir -p /www/

#nginx
RUN rm -f /etc/nginx/conf.d/*.conf
COPY ./nginx.conf /etc/nginx/conf.d/deafult.conf

#SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=ttamesha"
RUN adduser -D 'admin' ; echo 'admin:password' | chpasswd;

COPY ./start.sh ./
COPY ./supervisor.conf /etc/supervisord.conf
RUN chmod +rw /etc/supervisord.conf
RUN chmod u+x ./start.sh

EXPOSE 80 443 22

CMD ["sh", "./start.sh"]
