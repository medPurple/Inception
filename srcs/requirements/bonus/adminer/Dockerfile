FROM debian:11

MAINTAINER <wmessmer@42.fr>

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y adminer

RUN mkdir -p /var/www/adminer

RUN mv /usr/share/adminer/* /var/www/adminer/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
