FROM debian:buster

# installation du package mariadb-server

RUN apt update && \
	apt install -y mariadb-server

# copie des scripts et de la configuration de la base de donnée

COPY	./run.sh /
COPY 	./config/database.sql /tmp/

# moddification du droit d'execution du script run

RUN 	chmod +x /run.sh 

# indique le port exposé

EXPOSE 3306

VOLUME /var/lib/mysql

CMD ["/run.sh"]
