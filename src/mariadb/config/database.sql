
/** methode d authentification normale donc : set le password **/
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSWORD');

/** Creation du premier user, l'autre sera cree via le container wordpress */
CREATE DATABASE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED by '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER@'%';

/** Il faut flush pour que le grant soit active */
FLUSH PRIVILEGES;
