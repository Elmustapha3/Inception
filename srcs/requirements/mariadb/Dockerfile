FROM debian:bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


COPY ./tools/script.sh .


RUN chmod +x script.sh

EXPOSE 3306

CMD [ "/bin/sh", "script.sh"]