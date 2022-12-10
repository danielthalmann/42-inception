FROM debian:buster

RUN apt update && \
	apt install -y mariadb-server

EXPOSE 3306
VOLUME /var/lib/mysql

CMD ["mysqld_safe"]
