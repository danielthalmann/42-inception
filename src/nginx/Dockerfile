FROM debian:buster

# installation du package nginx et openssl

RUN apt update && \
	apt install -y nginx \
		openssl

# création du répertoire /var/www et /var/log/nginx

RUN mkdir -p /var/www ; mkdir -p /var/log/nginx

# copie les fichiers de configuration

ADD ./config/nginx.conf /etc/nginx/nginx.conf 
ADD ./config/fastcgi.conf /etc/nginx/fastcgi.conf 
ADD ./config/mime.types /etc/nginx/mime.types 
ADD ./config/proxy.conf /etc/nginx/proxy.conf 

RUN openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out dthalman.crt \
            -keyout dthalman.key \
            -subj "/C=CH/ST=Lausanne/L=Renens/O=42/OU=42/CN=dthalman.42.fr/UID=dthalman"


# indique le port exposé

EXPOSE 8000

# indique le volume dans le container

VOLUME /var/www

#  Nginx utilise la directive daemon off pour démarrer le processus en premier plan

CMD ["nginx", "-g", "daemon off;"]
