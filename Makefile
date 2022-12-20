

all: build

mariadb:
	docker build -t mariadb ./src/mariadb

nginx:
	docker build -t nginx ./src/nginx

wordpress:
	docker build -t wordpress ./src/wordpress

run-nginx:
	docker run -d -p 443:443 nginx
	docker ps
 
build:
	docker-compose build

tail:
	docker compose -f srcs/docker-compose.yml up --build

.phony: all mariadb nginx wordpress