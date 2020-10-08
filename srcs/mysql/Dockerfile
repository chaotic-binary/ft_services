FROM alpine:latest

#ARG MINIKUBE_IP

VOLUME [ "/var/lib/mysql" ]

# packages
RUN apk update \
&& apk add mariadb mariadb-client \
&& apk add --no-cache --upgrade bash \
&& apk add openrc --no-cache

# Copy initialisation scripts
COPY ./start.sh .
COPY ./mysql_cnf.sql /etc/
#COPY ./setup_db.sh .
#COPY ./wordpress.sql .
COPY ./my.cnf /etc/

#RUN sed -i "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./wordpress.sql

# Add permissions
RUN chmod +x start.sh
#&& chmod +x setup_db.sh

EXPOSE 3306
ENTRYPOINT [ "./start.sh" ]
