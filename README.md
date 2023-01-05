# Inception

Ce projet a pour but d’approfondir ses connaissances en utilisant Docker.
I faut virtualiser plusieurs images Docker en les créant dans une nouvelle machine
virtuelle personnelle.

On doit mettre en place :

  - Un container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement.

  - Un container Docker contenant WordPress + php-fpm (installé et configuré) uni-quement sans 
  nginx.

  - Un container Docker contenant MariaDB uniquement sans nginx.

  - Un volume contenant votre base de données WordPress.
  
  - Un second volume contenant les fichiers de votre site WordPress.
  
  - Un docker-network qui fera le lien entre vos containers

# Table des matières 

- [Inception](#inception)
- [Table des matières](#table-des-matières)
- [Installation du docker sur debian](#installation-du-docker-sur-debian)
  - [ajout des packages pour docker](#ajout-des-packages-pour-docker)
  - [droit d'utilisation de la commande docker](#droit-dutilisation-de-la-commande-docker)
- [Mini guide des commandes Docker](#mini-guide-des-commandes-docker)
  - [run : démarrer un container](#run--démarrer-un-container)
  - [stop : stopper un container](#stop--stopper-un-container)
  - [exec : utilisation bash dans le container](#exec--utilisation-bash-dans-le-container)
  - [ps : afficher les container en cours d'execution](#ps--afficher-les-container-en-cours-dexecution)
  - [build : création d'une image à partir d'un fichier Docker](#build--création-dune-image-à-partir-dun-fichier-docker)
  - [pull : Récupérer une image du Docker Hub](#pull--récupérer-une-image-du-docker-hub)
  - [system prune : nettoyage du système](#system-prune--nettoyage-du-système)
  - [tag : tag d'image](#tag--tag-dimage)
  - [push : transmettre l'image au docker hub](#push--transmettre-limage-au-docker-hub)
- [Produire un fichier Dockerfile](#produire-un-fichier-dockerfile)
- [docker-compose](#docker-compose)
  - [installation du docker-compose](#installation-du-docker-compose)
  - [commandes](#commandes)
    - [up](#up)
    - [ps](#ps)
    - [logs](#logs)
    - [stop](#stop)
    - [down](#down)
    - [config](#config)
  - [paramètre du docker-compose](#paramètre-du-docker-compose)
    - [restart](#restart)
  - [container\_name](#container_name)
- [nginx](#nginx)
  - [creation de la clee ssl pour le serveur](#creation-de-la-clee-ssl-pour-le-serveur)


# Installation du docker sur debian

## ajout des packages pour docker

```bash
 sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

Installation de la clé GPG

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Ajoute de repository de docker

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Mise en place des packages docker

```bash
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

## droit d'utilisation de la commande docker

```bash
sudo usermod -aG docker dthalman
```

# Mini guide des commandes Docker

[toutes les commandes](https://docs.docker.com/engine/reference/commandline/docker/)

## run : démarrer un container

```bash
docker run -d -p 8080:80 nginx
```

-p redirection de port

-d detache le processus. Pour le démarrage de server

## stop : stopper un container

```bash
docker stop ID_RETOURNÉ_LORS_DU_DOCKER_RUN
```

## exec : utilisation bash dans le container

```bash
docker exec -ti ID_RETOURNÉ_LORS_DU_DOCKER_RUN bash

-ti permet d'avoir un shell bash pleinement opérationnel

## ps : afficher les container en cours d'execution

```
docker ps
```
## build : création d'une image à partir d'un fichier Docker

```
docker build -t YOUR_BUILD .
```

-t donne le nom target du build

. correspond au répertoire dans lequel se trouve le fichier Docker 


## pull : Récupérer une image du Docker Hub

```
docker pull hello-world
```

## system prune : nettoyage du système

```
docker system prune
```

## tag : tag d'image

```
docker tag YOUR_BUILD:latest YOUR_USERNAME/YOUR_BUILD:latest
```

## push : transmettre l'image au docker hub

```
docker push YOUR_USERNAME/YOUR_BUILD:latest
```


# Produire un fichier Dockerfile

les instructions suivantes peuvent être utilisé dans le Dockerfile

```FROM``` permet de définir l'image source 

```RUN``` permet d’exécuter des commandes dans votre conteneur

```ADD``` permet d'ajouter des fichiers dans votre conteneur ;

```WORKDIR``` permet de définir votre répertoire de travail ;

```EXPOSE``` qui permet de définir les ports d'écoute par défaut ;

```VOLUME``` qui permet de définir les volumes utilisables ;

```CMD``` permet de définir la commande par défaut lors de l’exécution de vos conteneurs Docker.


Le fichier .dockerignore permet d'igniorer certain fichier dans le container

# docker-compose

## installation du docker-compose

```
 DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

 mkdir -p $DOCKER_CONFIG/cli-plugins

 curl -SL https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
```

```
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```

## commandes

### up 

docker-compose up -d vous permettra de démarrer l'ensemble des conteneurs en arrière-plan 

-f permet de spécifier le lieu du fichier docker-compose.yaml

### ps

docker-compose ps vous permettra de voir le statut de l'ensemble de votre stack 

### logs

docker-compose logs -f --tail 5 vous permettra d'afficher les logs de votre stack 

### stop

docker-compose stop vous permettra d'arrêter l'ensemble des services d'une stack 

### down

docker-compose down vous permettra de détruire l'ensemble des ressources d'une stack 

### config

docker-compose config vous permettra de valider la syntaxe de votre fichier docker-compose.yml 

## paramètre du docker-compose

### restart 

définit la politique de redémarrage lors de l'arrêt du conteneur.

  no : stratégie par défaut. Ne redémarre en aucun cas le conteneur.
  always : redémarre toujours le conteneur jusqu'à sa suppression.
  on-failure : redémarre un conteneur si le code de sortie indique une erreur.
  unless-stopped : redémarre un conteneur quel que soit le code de sortie, mais arrête de redémarrer lorsque le service est arrêté ou supprimé.

## container_name 

est une chaîne qui spécifie un nom de conteneur personnalisé, plutôt qu'un nom par défaut généré.

# nginx

## creation de la clee ssl pour le serveur

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out dthalman.crt \
            -keyout dthalman.key \
            -subj "/C=CH/ST=Lausanne/L=Renens/O=42/OU=42/CN=dthalman.42.fr/UID=dthalman"
