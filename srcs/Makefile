

all:
	docker-compose build

mariadb:
	docker build -t mariadb ./mariadb

ngnx:
	docker build -t nginx ./nginx

wordpress:
	docker build -t nginx ./wordpress

run:
	docker run -d -p 80:80 nginx
	