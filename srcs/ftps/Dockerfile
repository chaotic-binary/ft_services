FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add openssl \
	vsftpd

RUN mkdir -p /etc/vsftpd/private \
	&& openssl req -newkey rsa:2048 -nodes -keyout /etc/vsftpd/private/vsftpd.pem \
		-x509 -days 90 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=ttamesha" \
		-out /etc/vsftpd/private/vsftpd.pem \
	&& chmod 755 /etc/vsftpd/private/vsftpd.pem

RUN echo 'root:root' | chpasswd

COPY vsftpd.conf		/etc/vsftpd/vsftp_ftps.conf
COPY start.sh			/tmp/

EXPOSE 21
CMD ["sh", "/tmp/start.sh"]
