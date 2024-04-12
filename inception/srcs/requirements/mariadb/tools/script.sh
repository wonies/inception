#!/bin/sh

# set -e
# export MARIADB_NAME=wordpress
# export MARIADB_USER=wonie
# export MARIADB_PASSWORD=0000
# export WORDPRESS_DB_NAME=wordpress
# export WORDPRESS_DB_HOST=mariadb
# #마리아와 이름이 같아야함
# export WORDPRESS_DB_USER=wonie
# export WORDPRESS_DB_PASS=0000
# export WORDPRESS_TITLE=inception
# export WORDPRESS_PORT=9000

# export WORDPRESS_ADMIN_NAME=wonhshin
# export WORDPRESS_ADMIN_PASS=0000
# export WORDPRESS_ADMIN_EMAIL=wonhshin@student.42seoul.kr
# export WORDPRESS_USER_NAME=user
# export WORDPRESS_USER_EMAIL=user@aa.bb
# export WORDPRESS_USER_PASS=0000






echo "=== start mariadb ==="
service mariadb start
sleep 3

# # 데이터베이스 생성 (존재하지 않는 경우)
if [ ! -d "/var/lib/mysql/${MARIADB_NAME}" ]; then
echo "==mariadb creating"
#echo  "mariadb -uroot -p$MARIADB_ROOT_PASSWORD -e \" | ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';\""

	mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_NAME};"

	mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

	mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'%';"

	mysql -e "FLUSH PRIVILEGES;"
fi

# echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"
# echo "===mariadb==="
# # # 사용자 생성 (변수 확장을 위해 더블 쿼트 사용)
# echo "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"

# # # 사용자에게 모든 권한 부여
# echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"

# # # 권한 적용
# echo "FLUSH PRIVILEGES;" | mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"

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
exec mysqld_safe
#exec "$@"