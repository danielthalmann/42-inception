FROM debian:buster

RUN apt update && \
	apt install -y wget tar mariadb-client

RUN mkdir -p /var/www 
RUN wget https://wordpress.org/latest.tar.gz -P /var/www

WORKDIR /var/www

RUN tar -xzvf latest.tar.gz

VOLUME /var/www

CMD ["nginx", "-g", "daemon off;"]
