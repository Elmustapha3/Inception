FROM debian:bullseye

RUN  apt update &&  apt upgrade -y && apt install -y nginx openssl 

COPY ./conf/default /etc/nginx/sites-available/.

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD ["bash", "script.sh"]
