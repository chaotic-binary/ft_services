FROM alpine:latest

# packages
RUN apk update \
&& apk add openrc --no-cache \
&& apk add openssh \
&& apk add openssl \
&& apk add supervisor \
&& apk add nginx

VOLUME		[ "/sys/fs/cgroup" ]

RUN mkdir -p /run/nginx /var/www

RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/deafult.conf
COPY ./start.sh /tmp/start.sh
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./index.html		/var/www/

#SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=ttamesha"
RUN			echo "daemon off;" >> /etc/nginx/nginx.conf
#SSH
#RUN ssh-keygen -A \
RUN adduser -D 'admin' ; echo 'admin:password' | chpasswd;

RUN chmod +rw /etc/supervisord.conf
RUN chmod u+x /tmp/start.sh

EXPOSE 80 443 22

#CMD ["sh", "./start.sh"]

EXPOSE 80 443 22
ENTRYPOINT [ "sh", "/tmp/start.sh" ]