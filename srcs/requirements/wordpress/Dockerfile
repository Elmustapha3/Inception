FROM debian:bullseye

RUN apt-get update && apt-get install -y php-fpm \
                php-mysqli curl
                # php-common php-curl \
                # php-gd php-mbstring \
                # php-xml php-xmlrpc \
                # php-zip wget -y        

COPY ./tools/script.sh /opt/scripts/script.sh

RUN chmod +x /opt/scripts/script.sh

# EXPOSE 9000

CMD ["./opt/scripts/script.sh"]
