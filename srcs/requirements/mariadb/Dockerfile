FROM debian:bullseye

MAINTAINER <wmessmer@42.fr> 

RUN apt-get update -y && apt upgrade -y && apt install mariadb-server -y

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh .

RUN chmod 755 ./script.sh

EXPOSE 3306

CMD ["sh", "script.sh"]
