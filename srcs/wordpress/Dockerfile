FROM debian:buster

RUN apt update && \
	apt install -y wget tar mariadb-client \
	php7.4 \
	php7.4-mysql \
	php7.4-cli \
	php7.4-mbstring \
	php7.4-curl \
	php7.4-gd \
	php7.4-xml 


RUN mkdir -p /var/www 
RUN wget https://wordpress.org/latest.tar.gz -P /var/www

WORKDIR /var/www

RUN tar -xzvf latest.tar.gz

VOLUME /var/www
