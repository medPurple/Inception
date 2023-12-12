FROM debian:bullseye

MAINTAINER <wmessmer@42.fr> 
EXPOSE 6397

RUN apt update -y 
RUN apt install -y redis-server

COPY conf/redis.conf /etc/redis/redis.conf

ENTRYPOINT ["redis-server", "--protected-mode no" ]