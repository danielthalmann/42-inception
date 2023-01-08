FROM debian:buster-20221205

# installation du package mariadb-server

RUN apt update && \
	apt install -y	mariadb-server \
					mariadb-client

# copie des scripts et de la configuration de la base de donnée

COPY	./entrypoint.sh /
COPY 	./config/database.sql /tmp/

# modification du droit d'execution du script run

RUN 	chmod +x /entrypoint.sh 

# indique le port exposé

EXPOSE 3306

VOLUME /var/lib/mysql

ENV MARIADB_DATABASE=${MARIADB_DATABASE} \
	MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD} \
	MARIADB_DATABASE=${MARIADB_DATABASE} \
	MARIADB_USER=${MARIADB_USER} \
	MARIADB_PASSWORD=${MARIADB_PASSWORD}

ENTRYPOINT /entrypoint.sh
