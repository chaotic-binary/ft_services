FROM alpine:latest

#ARG MINIKUBE_IP

#packeges
RUN apk update && apk add wget \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
php7-curl php7-mbstring php7-json php7-session
#RUN wget curl -y

RUN mkdir /www

#wordpress
RUN wget https://wordpress.org/latest.tar.gz \
&& tar xzf latest.tar.gz \
&& mv wordpress /www/ \
&& rm ./latest.tar.gz
COPY ./wp-config.php /www/wordpress
COPY start.sh /start.sh
RUN chmod +x /start.sh
#RUN sed -i "s/MINIKUBE_IP/$MINIKUBE_IP/g" /www/wp-config.php

EXPOSE 5050

CMD [ "sh", "start.sh"]
