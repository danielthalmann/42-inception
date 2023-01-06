#!/usr/bin/env bash

target=/etc/mysql/mariadb.conf.d/50-server.cnf

grep -E "bind-address( )+ = 127.0.0.1" $target > /dev/null
# $? contient le code de retour de la dernière opération

# si le retour d erreur est 0
if [ $? -eq 0 ]; then

    # ajout de la configutation pour le serveur
    # printf '\n\nbind-address=0.0.0.0\nport=3306\n' >> $target
    sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" $target

fi

# controle si la bd est deja cree
if [ -e /tmp/database.sql ]; then

    if [ -z "$MARIADB_DATABASE" ]; then

        echo "[-] no config variables"
        echo "no config variables" >> /log.err

    else

        echo "[+] create database"

        /usr/bin/mysqld_safe &

        sleep 1

        eval "echo \"$(cat /tmp/database.sql)\"" > /tmp/database.compiled.sql
        cat /tmp/database.compiled.sql | mariadb

        killall mysqld
        sleep 2

        # applique les droits sur le répertoire de la base de donnée
        chown -R mysql:mysql /var/lib/mysql

        rm /tmp/database.sql
    fi

else

    echo "[+] database created"

fi

if [ -e /usr/bin/mysqld_safe ]; then

    echo "[+] start server mariadb"
    # Lancement du serveur 
    /usr/bin/mysqld_safe

else

    echo "[-] Server not installed"

fi
