#! bin/sh

SQL_DB_NAME="salut"
SQL_DB_USR="USR"
SQL_DB_PSWD="PSW"
SQL_ROOT_PSWD="PSW"

if [ -d "/var/lib/mysql/salut" ]
then   echo "[ERROR]\n\t--> salut already exist"
else
    service mariadb start
    sleep 1
    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DB_NAME};"
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_DB_USR}'@'%' IDENTIFIED BY '${SQL_DB_PSWD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DB_NAME}.* TO '${SQL_DB_USR}'@'%' IDENTIFIED BY '${SQL_DB_PSWD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PSWD}';"
    sleep 1
    mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p${SQL_ROOT_PSWD} shutdown
fi
exec mysqld