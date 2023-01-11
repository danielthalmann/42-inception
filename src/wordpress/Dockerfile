FROM debian:buster-20221205

RUN apt update && \
    apt upgrade && \
    apt -y install wget \
				   tar \
				   lsb-release \
				   apt-transport-https \
				   ca-certificates

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt update && \
        apt install -y php7.4 \
        php7.4-mysql \
        php7.4-cli \
        php7.4-mbstring \
        php7.4-curl \
        php7.4-gd \
        php7.4-xml \
		php7.4-fpm 

RUN mkdir -p /var/www

RUN cd /tmp && \
		wget https://wordpress.org/latest.tar.gz -P /tmp && \ 
		tar xvf latest.tar.gz && \
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp && \
		mv /tmp/wp-cli.phar /usr/local/bin/wp && \
		chmod +x /usr/local/bin/wp

COPY	./entrypoint.sh /
COPY	./wait-for-it.sh /
COPY	./config/wp-config.php /tmp

RUN chmod +x /wait-for-it.sh

# RUN cp -r /tmp/wordpress/* /var/www && \
# 		chown -Rv www-data /var/www 

ENV	WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST} \
	WORDPRESS_DB_USER=${WORDPRESS_DB_USER} \
	WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD} \
	WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME} \
	WORDPRESS_URL=${WORDPRESS_URL} \
	WORDPRESS_TITLE=${WORDPRESS_TITLE} \
	WORDPRESS_ADMIN_USER=${WORDPRESS_ADMIN_USER} \
	WORDPRESS_ADMIN_PASSWORD=${WORDPRESS_ADMIN_PASSWORD} \
	WORDPRESS_ADMIN_EMAIL=${WORDPRESS_ADMIN_EMAIL} \
	WORDPRESS_USER=${WORDPRESS_USER} \
	WORDPRESS_USER_EMAIL=${WORDPRESS_USER_EMAIL} \
	WORDPRESS_USER_PASSWORD=${WORDPRESS_USER_PASSWORD}

EXPOSE 9000

WORKDIR /var/www

ENTRYPOINT /entrypoint.sh
