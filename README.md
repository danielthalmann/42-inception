
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
## installation du docker-compose

```
 DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

 mkdir -p $DOCKER_CONFIG/cli-plugins

 curl -SL https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
```

```
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```



## creation de la clee ssl

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out example.crt \
            -keyout example.key


# Mini guide des commandes Docker


## démarrer un container

```bash
docker run -d -p 8080:80 nginx
```

-p redirection de port
-d detache le processus. Pour le démarrage de server

## stopper un container

```bash
docker stop ID_RETOURNÉ_LORS_DU_DOCKER_RUN
```

## utilisation bash dans le container

docker exec -ti ID_RETOURNÉ_LORS_DU_DOCKER_RUN bash

-ti permet d'avoir un shell bash pleinement opérationnel

## afficher les container en cours d'execution

```
docker ps
```
## Récupérer une image du Docker Hub

```
docker pull hello-world
```

## nettoyage du système

```
docker system prune
```

# Produire un fichier Dockerfile

Docker, vous savez utiliser les instructions suivantes :

```FROM``` permet de définir l'image source 

```RUN``` permet d’exécuter des commandes dans votre conteneur

```ADD``` permet d'ajouter des fichiers dans votre conteneur ;

```WORKDIR``` permet de définir votre répertoire de travail ;

```EXPOSE``` qui permet de définir les ports d'écoute par défaut ;

```VOLUME``` qui permet de définir les volumes utilisables ;

```CMD``` permet de définir la commande par défaut lors de l’exécution de vos conteneurs Docker.


Le fichier .dockerignore permet d'igniorer certain fichier dans le container