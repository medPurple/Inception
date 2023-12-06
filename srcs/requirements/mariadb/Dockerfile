FROM debian:11

MAINTAINER wmessmer<wmessmer@student.42.fr>

EXPOSE 3306

RUN apt update -y 
RUN apt install -y mariadb-server 

COPY conf/mariadb.conf etc/mysql/mariadb.conf.d/50-server-cnf
COPY tools/script.sh .

ENTRYPOINT [ "sh", "script.sh" ]

