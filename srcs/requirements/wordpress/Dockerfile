FROM debian:11

MAINTAINER wmessmer<wmessmer@student.42.fr>

RUN apt update -y 
RUN apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar usr/local/bin/wp

COPY tools/wordpress_conf.sh /usr/local/bin/wordpress_conf.sh
RUN chmod 755 /usr/local/bin/wordpress_conf.sh

#WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "sh", "usr/local/bin/wordpress_conf.sh" ]