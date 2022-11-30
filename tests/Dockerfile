FROM alpine:3.14

# execute une commande pour preparer le container
RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

# ajoute des fichiers au container
ADD . /app/


# repertoire par defaut du container
WORKDIR /app

RUN npm install

# L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute. 
EXPOSE 2368

# L'instruction VOLUME permet d'indiquer quel répertoire vous voulez partager avec votre host.
VOLUME /app/logs

CMD npm run start