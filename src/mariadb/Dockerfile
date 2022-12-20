FROM debian:buster

RUN apt update && \
	apt install -y mariadb-server

COPY	./run.sh /
COPY 	./config/database.sql /tmp/

RUN 	chmod +x /run.sh 

EXPOSE 3306

VOLUME /var/lib/mysql

CMD ["/run.sh"]
