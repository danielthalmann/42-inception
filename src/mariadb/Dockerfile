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

ENV MARIADB_DATABASE=${MARIADB_DATABASE} \
	MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD} \
	MARIADB_DATABASE=${MARIADB_DATABASE} \
	MARIADB_USER=${MARIADB_USER} \
	MARIADB_PASSWORD=${MARIADB_PASSWORD}s 

CMD ["/run.sh"]
