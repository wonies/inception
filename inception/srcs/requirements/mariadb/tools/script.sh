#!/bin/sh

set -e

# export MARIADB_ROOT_PASSWORD=0000
# export MARIADB_NAME=wordpress
# export MARIADB_USER=wonie
# export MARIADB_PASSWORD=0000



echo "==enter mariadb==="

# mkdir -p /run/mysqld/
# chown -R mysql:mysql /var/run/mysqld
# chmod -R 755 /var/run/mysqld
# chmod -R 755 /var/lib/mysql
echo "=== start mariadb ==="
# sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# exec mariadbd --bind-address=0.0.0.0
# MySQL 서비스 시작
# sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
# mysql
service mariadb start
sleep 1

# service mariadb restart
# mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# # 데이터베이스 생성 (존재하지 않는 경우)
echo "==mariadb creating"
echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"
echo "===mariadb==="
# # 사용자 생성 (변수 확장을 위해 더블 쿼트 사용)
echo "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"

# # 사용자에게 모든 권한 부여
echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"

# # 권한 적용
echo "FLUSH PRIVILEGES;" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"

# service mariadb status

# mariadb -u root -p $MARIADB_ROOT_PASSWORD<<EOSQL
# CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;
# GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
# FLUSH PRIVILEGES;
# EOSQL
# mariadb 서비스 종료

echo "===mariadb end==="
service mariadb stop

# CMD에서 지정된 명령어 실행
# mysqld_safe
#exec "$@"