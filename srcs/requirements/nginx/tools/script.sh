#!/bin/bash

openssl req -x509  -newkey rsa:2048 -nodes -keyout $CERTS_KEY -out $CERTS_ -subj "/C=MA/ST=IDF/L=Benguerir/O=42/OU=42/CN=$DOMAIN_NAME/UID=elmustapha"

sed -i "s|server_name DOMAIN_NAME_PATH;|server_name $DOMAIN_NAME;|" /etc/nginx/sites-available/default
sed -i "s|ssl_certificate CERTS_PATH;|ssl_certificate $CERTS_;|" /etc/nginx/sites-available/default
sed -i "s|ssl_certificate_key CERTS_KEY_PATH;|ssl_certificate_key $CERTS_KEY;|" /etc/nginx/sites-available/default

exec /usr/sbin/nginx -g "daemon off;"
