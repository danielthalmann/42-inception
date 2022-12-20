#!/usr/bin/env bash

# controle si la bd est deja cree
cat /tmp/database.sql 2> /dev/null

# $? valeur de retour
if [ $? -eq 0 ]; then
	
	usr/bin/mysqld_safe 

else

    if [ -z $MARIADB_DATABASE  ]; then

        echo "no config variables"

    else


        # Utiliser mysql_embedded pour executer un script sans démarrer le serveur
        # https://mariadb.com/de/resources/blog/using-mysql_embedded-and-mysqld-bootstrap-to-tinker-with-privilege-tables/  
        eval "echo \"$(cat /tmp/database.sql)\"" | mysql_embedded

        if [ $? -eq 0 ]; then

            # si y a pas d'erreur, on supprime le script
            rm /tmp/database.sql
            
        fi
    fi
fi

# Lancement du serveur 
usr/bin/mysqld_safe
