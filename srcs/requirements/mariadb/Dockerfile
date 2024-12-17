FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

COPY ./tools/script.sh /opt/scripts/script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.

#to check
RUN mkdir /run/mysqld  

RUN chmod +x /opt/scripts/script.sh

EXPOSE 3306

CMD ["./opt/scripts/script.sh"]

