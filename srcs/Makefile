

all:
	docker-compose build

mariadb:
	docker build -t mariadb ./mariadb

nginx:
	docker build -t nginx ./nginx

wordpress:
	docker build -t wordpress ./wordpress

run:
	docker run -d -p 80:80 nginx

.phony: all mariadb nginx wordpress