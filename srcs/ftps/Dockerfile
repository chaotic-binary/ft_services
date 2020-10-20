FROM	alpine:latest

RUN		apk update && \
		apk upgrade && \
		apk add openssl openrc vsftpd

RUN		mkdir -p /var/ftp /ftp_user ;

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=ttamesha" \
		-keyout /etc/vsftpd/vsftpd.pem \
		-out /etc/vsftpd/vsftpd.pem

# Create user
RUN		mkdir -p /ftp_user && \
		adduser --home=/ftp_user -D ftp_user && \
		echo "ftp_user:password" | chpasswd

COPY	vsftpd.conf		/etc/vsftpd/vsftp.conf

RUN		echo "ftp_user" >> /etc/vsftpd/vsftpd.userlist

COPY	start.sh		/tmp/
RUN		chmod u+x		/tmp/start.sh

EXPOSE	20 21 21000-22000
ENTRYPOINT	["sh", "/tmp/start.sh"]
