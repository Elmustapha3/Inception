#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root
./wp-cli.phar core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
./wp-cli.phar user create "$NORMAL_USER" "$NORMAL_EMAIL" --user_pass="$NORMAL_PASSWORD" --role=editor --allow-root

mkdir /var/run/php 

echo "listen=wordpress:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

exec php-fpm7.4 -F