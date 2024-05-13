FROM debian:bullseye

RUN  apt update && apt install -y nginx

COPY ./tools/default /etc/nginx/sites-available/.

# COPY ./tools/index.html /usr/share/nginx/html/index.html


CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

