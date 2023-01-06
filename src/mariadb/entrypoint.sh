#!/usr/bin/env bash


# controle si la bd est deja cree
if [ -e /tmp/database.sql ]; then

    grep -E "bind-address=0.0.0.0" /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf > /dev/null
    #$? contient le code de retour de la dernière opération

    #si le retour d erreur et n'est pas egale a 0 alors
    if [ ! $? -eq 0 ]; then

        # ajout de la configutation pour le serveur
        printf '\n\nbind-address=0.0.0.0\nport=3306\n' >> /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf

    fi
	
    if [ -z "$MARIADB_DATABASE" ]; then

        echo "[-] no config variables"
        echo "no config variables" >> /log.err

    else

        echo "[+] create database"

        # Utiliser mysql_embedded pour executer un script sans démarrer le serveur
        # https://mariadb.com/de/resources/blog/using-mysql_embedded-and-mysqld-bootstrap-to-tinker-with-privilege-tables/  
        eval "echo \"$(cat /tmp/database.sql)\"" | mysql_embedded

        # applique les droits sur le répertoire de la base de donnée
        chown -R mysql:mysql /var/lib/mysql

        if [ $? -eq 0 ]; then

            # si y a pas d'erreur, on supprime le script
            rm /tmp/database.sql
            
        fi
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
