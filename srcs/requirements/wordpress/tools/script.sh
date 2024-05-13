#!/bin/bash

# mkdir /var/www/html


# chown -R www-data:www-data /var/www/html

# pwd 
# echo "----------------"


cd /var/www/html


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=wppass --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root


# pwd
# echo "----------------"

# wget https://wordpress.org/latest.tar.gz

# tar -xzvf latest.tar.gz > /dev/null

# ls 

# echo "----------------"

# rm -rf latest.tar.gz

# ls wordpress
mkdir /var/run/php 
echo "listen=wordpress:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

# cat www.conf | grep "listen"

php-fpm7.4 -F