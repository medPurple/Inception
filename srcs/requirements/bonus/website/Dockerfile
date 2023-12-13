FROM debian:bullseye

MAINTAINER <wmessmer@42.fr>
EXPOSE 4242

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install nodejs openssl -y \
    && mkdir -p /var/www/html

RUN mkdir -p /etc/node/ssl

RUN openssl req -x509 -nodes -out /etc/node/ssl/inception.crt \
                             -keyout /etc/node/ssl/inception.key \
                             -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=wmessmer.42.fr/UID=wmessmer"

COPY /conf/index.html /var/www/html/
COPY /conf/run.js /tmp/run.js

CMD ["node", "/tmp/run.js"]
