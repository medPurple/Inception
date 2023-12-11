#!/bin/sh

service mariadb start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DBNAME};"

mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DBNAME}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

sleep 1

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld_safe 
