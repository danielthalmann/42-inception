#!/usr/bin/env bash

# si on ne trouve pas la config, on initialise le premier démarrage
if [ ! -e "/var/www/wp-config.php" ]; then

	target="/etc/php/7.4/fpm/pool.d/www.conf"

	#grep -E "listen = /run/php/php7.4-fpm.sock" $target
	sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" $target
	
	echo " " >> $target
	echo "env[WORDPRESS_DB_NAME] = \$WORDPRESS_DB_NAME" >> $target
	echo "env[WORDPRESS_DB_USER] = \$WORDPRESS_DB_USER" >> $target
	echo "env[WORDPRESS_DB_PASSWORD] = \$WORDPRESS_DB_PASSWORD" >> $target
	echo "env[WORDPRESS_DB_HOST] = \$WORDPRESS_DB_HOST" >> $target

	mkdir -p /run/php/
	
	# cp /var/www/config/wp-config /var/www/wp-config.php
	cp -r /tmp/wordpress/* /var/www

	cp /tmp/wp-config.php /var/www

	# attend sur la base de donnée 
	/wait-fot-it $WORDPRESS_DB_HOST:3306
	
	# on laisse encore un peu de temps
	sleep 4

	cd /var/www/

	chown -Rv www-data:www-data /var/www 

	# Configuration du site wordpress
	# wp commande wordpress
	wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" \
    	--admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email --allow-root

	#wp plugin install redis-cache --activate
	wp plugin update --all --allow-root

	# Installation d'un theme et activation ce celui-ci
	wp theme install twentysixteen --activate --allow-root

	# création d'un utilisateur
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=editor --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

	# Creation d'un article pour l'example 
	wp post generate --count=1 --post_title="Salut, coucou, je crée un nouveau post" --allow-root

fi

# faire tourner wordpress mais aussi pour que le container keep running
php-fpm7.4 --nodaemonize
