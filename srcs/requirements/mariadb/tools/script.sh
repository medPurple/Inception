#!/bin/sh

if [ -d "/var/lib/mysql/salut" ]; then
    echo "[ERROR]\n\t--> salut already exists"
else
    service mariadb start
    sleep 1
    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DB_NAME};"
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_DB_USR}'@'%' IDENTIFIED BY '${SQL_DB_PSWD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DB_NAME}.* TO '${SQL_DB_USR}'@'%' IDENTIFIED BY '${SQL_DB_PSWD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    sleep 1
    mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown
fi
exec mysqld
