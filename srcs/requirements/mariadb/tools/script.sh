#!/bin/sh

echo "Initializing MariaDB..."

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

mysql_install_db --user=mysql --ldata=/var/lib/mysql

mysqld --datadir='/var/lib/mysql' &

until mysqladmin ping --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

echo "Database and user created successfully."

wait
