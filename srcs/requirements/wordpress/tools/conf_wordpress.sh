#!/bin/sh

sleep 10

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "wordpress is already installed and configured\n"
else
    wp core download --allow-root

    wp core config --dbname=$SQL_DBNAME \
                   --dbuser=$SQL_USER \
                   --dbpass=$SQL_PASSWORD \
                   --dbhost=$SQL_HOST \
                   --allow-root

    wp core install --url=$WP_URL \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --allow-root

    wp user create $WP_USER $WP_USER_EMAIL --role=author \
                    --user_pass=$WP_USER_PASSWORD \
                    --allow-root


fi

exec /usr/sbin/php-fpm7.4 -F


