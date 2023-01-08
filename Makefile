
# --env-file permet de modifier le chemin d'environnement
ENV_FILE		= .env
DCOMPOSE_FILE	= -f src/docker-compose.yaml --env-file $(ENV_FILE)
DOCKER			= docker

# include environement variables
include $(ENV_FILE)

all: run

shell-mariadb:
	$(DOCKER) exec -ti mariadb bash

mariadb:
	$(DOCKER) build -t mariadb ./src/mariadb

nginx:
	$(DOCKER) build -t nginx ./src/nginx

wordpress:
	$(DOCKER) build -t wordpress ./src/wordpress

vsftpd:
	$(DOCKER) build -t vsftpd ./src/vsftpd

run-nginx:
	$(DOCKER) run -d -p 443:443 -p 80:80 nginx
	$(DOCKER) ps
 
run-mariadb:
	$(DOCKER) run -d -p 3306:3306 mariadb
	$(DOCKER) ps

run-wordpress:
	$(DOCKER) run -d wordpress
	$(DOCKER) ps

run-vsftpd:
	$(DOCKER) run -d vsftpd
	$(DOCKER) ps

make-folder:
	mkdir -p $(WEB_VOLUME)
	mkdir -p $(DB_VOLUME)

# Create and start containers
# --detach , -d		Detached mode: Run containers in the background
run: make-folder
	$(DOCKER) compose $(DCOMPOSE_FILE) up -d

# Build or rebuild services
build: make-folder
	$(DOCKER) compose $(DCOMPOSE_FILE) build

# List containers
ps:
	$(DOCKER) compose $(DCOMPOSE_FILE) ps

# Stop services
stop:
	$(DOCKER) compose $(DCOMPOSE_FILE) stop

# Stop and remove containers, networks
# --rmi		Remove images used by services. 
#			"local" remove only images that don't have a custom tag ("local"|"all")
down:
	$(DOCKER) compose $(DCOMPOSE_FILE) down --rmi local

# verify config file
config:
	$(DOCKER) compose $(DCOMPOSE_FILE) config 

prune: 
	$(DOCKER) system prune --volumes --all --force

clean: down
	sudo rm -fr $(WEB_VOLUME)
	sudo rm -fr $(DB_VOLUME)

fclean: clean prune
	
test:
	DOCKER2=$(DOCKER)
	echo $$DOCKER2

re: fclean all

.phony: all mariadb nginx wordpress