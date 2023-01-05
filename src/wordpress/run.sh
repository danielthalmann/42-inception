#!/usr/bin/env bash

# si tu ne trouve pas "fichier" alors
if [ ! -e "/var/www/wp-config.php" ]; then
	cp /config/wp-config ./wp-config.php

	# attend sur la base de donnée 
	/wait-fot-it $WORDPRESS_DB_HOST

	# Configuration du site wordpress
	# wp commande wordpress
	wp-cli.phar core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" \
    	--admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email

	#wp plugin install redis-cache --activate
	wp-cli.phar plugin update --all

	# Installation d'un theme et activation ce celui-ci
	wp-cli.phar theme install twentysixteen --activate

	# création d'un utilisateur
	wp-cli.phar user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=editor --user_pass=$WORDPRESS_USER_PASSWORD

	# Creation d'un article pour l'example (change number)
	wp-cli.phar post generate --count=2 --post_title="Salut, coucou, j'ai réussi à faire un container"
fi

# faire tourner wordpress mais aussi pour que le container keep running
php-fpm7 --nodaemonize
