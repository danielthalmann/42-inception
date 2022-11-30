
# Installation du docker sur debian

## ajout des packages docker

```bash
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io
```

## droit d'utilisation de la commande docker

```bash
sudo usermod -aG docker dthalman
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
