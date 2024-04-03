FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install -y mariadb-server
COPY ./tools/script.sh /tmp/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld
RUN chmod -R 755 /var/lib/mysql
RUN chmod +x /tmp/script.sh

RUN chown -R mysql:mysql /etc/mysql/mariadb.conf.d
RUN chmod -R 755 /etc/mysql/mariadb.conf.d
EXPOSE 3306
ENTRYPOINT ["/tmp/script.sh" ]
CMD [ "mariadbd" ]