FROM debian:bullseye

MAINTAINER <wmessmer@42.fr> 

RUN apt update -y && apt upgrade -y && apt install -y nginx 

RUN apt install nano -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
                             -keyout /etc/nginx/ssl/inception.key \
                             -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=wmessmer.42.fr/UID=wmessmer"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]