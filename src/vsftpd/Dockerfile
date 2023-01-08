FROM debian:buster-20221205

RUN apt update && \
    apt upgrade && \
    apt -y install wget \
				   vsftpd

VOLUME /var/www

EXPOSE 20 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
