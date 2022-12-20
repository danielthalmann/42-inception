FROM debian:buster

RUN apt update && \
    apt upgrade && \
    apt -y install wget \
				   mariadb-client \
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

RUN wget https://wordpress.org/latest.tar.gz -P /tmp && \
		cd /tmp && \
		tar xvf latest.tar.gz && \
		cp -r /tmp/wordpress /var/www && \
		chown -Rv www-data /var/www 

RUN		cd /var/www && \
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar

WORKDIR /var/www

VOLUME /var/www