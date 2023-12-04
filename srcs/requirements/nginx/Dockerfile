FROM debian:11

MAINTAINER wmessmer<wmessmer@student.42.fr>

RUN apt update -y 
RUN apt install -y nano nginx openssl vim 


#Creation des dossiers et suppression des sites par default nginx
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx
RUN rm /etc/nginx/sites-available/default
#RUN rm /etc/nginx/sites-enable/default

#Generation certification ssl
RUN openssl req -new -x509 -days 365 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=wmessmer.42.fr/UID=wmessmer"

#Verif droit d'acces
RUN chmod 777 /etc/nginx/ssl/*
RUN chmod 777 -R /var/www 
RUN chown -R www-data:www-data /var/www/

#copie de configuation nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

#Specifie au container le port ecouté
EXPOSE 443 

#Lancement de nginx en tache de fond
ENTRYPOINT ["nginx","-g","daemon off;"]

