FROM debian:buster

RUN apt update && \
	apt install -y nginx

RUN mkdir -p /var/www ; mkdir -p /var/log/nginx

ADD ./config/nginx.conf /etc/nginx/nginx.conf 
ADD ./config/fastcgi.conf /etc/nginx/fastcgi.conf 
ADD ./config/mime.types /etc/nginx/mime.types 
ADD ./config/proxy.conf /etc/nginx/proxy.conf 

EXPOSE 8000
VOLUME /var/www

CMD ["nginx", "-g", "daemon off;"]
