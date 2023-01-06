#!/usr/bin/env bash

# si on ne trouve pas la config, on initialise le premier démarrage
if [ ! -e "/var/www/wp-config.php" ]; then

	target="/etc/php/7.4/fpm/pool.d/www.conf"

	#grep -E "listen = /run/php/php7.4-fpm.sock" $target
	sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" $target

	mkdir -p /run/php/
	
	# cp /var/www/config/wp-config /var/www/wp-config.php
	cp -r /tmp/wordpress/* /var/www

	chown -Rv www-data /var/www 

	# attend sur la base de donnée 
	# /wait-fot-it $WORDPRESS_DB_HOST

	cd /var/www/

	# Configuration du site wordpress
	# wp commande wordpress
	wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" \
    	--admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email

	#wp plugin install redis-cache --activate
	wp plugin update --all

	# Installation d'un theme et activation ce celui-ci
	wp theme install twentysixteen --activate

	# création d'un utilisateur
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=editor --user_pass=$WORDPRESS_USER_PASSWORD

	# Creation d'un article pour l'example (change number)
	wp post generate --count=2 --post_title="Salut, coucou, j'ai réussi à faire un container"
fi

# faire tourner wordpress mais aussi pour que le container keep running
php-fpm7.4 --nodaemonize
