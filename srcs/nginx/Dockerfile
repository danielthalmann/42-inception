FROM debian:buster

RUN apt update && \
	apt install -y nginx

ADD ./config/nginx.conf /etc/nginx/nginx.conf 

EXPOSE 80
VOLUME /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
