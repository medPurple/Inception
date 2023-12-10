#! bin/sh

sleep 5

if [ -f "/var/www/html/wp-config.php]" ]
then    echo "WP Already installed / configured"
else
    wp core download --allow-root
    wp core config   --allow-root \
                    --dbname=$SQL_DB_NAME \
                    --dbuser=$SQL_DB_USR \
                    --dbpass=$SQL_DB_PSWD \
                    --dbhost=mariadb:3306 \
                    --path='/var/www/html'
    wp core install --allow-root \
                    --url='localhost' \
                    --title='Wordpress' \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASS \
                    --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER_NAME $WP_USER_EMAIL \
                    --role='editor' \
                    --user_pass=$WP_USER_PSS \
                    --allow-root
    chown -R www-data:www-data /var/www/html
    chown -R www-data:www-data /var/www/html/wp-content
fi
exec /usr/sbin/php-fpm7.4 -F
    


