#!/bin/bash

# MariaDB 초기화 스크립트

echo "-----start mariadb-----"

service mariadb start

# 최대 대기 시간 (초 단위)
MAX_WAIT=10				# 최대 대기 시간
WAIT_INTERVAL=1			# 대기 간격 시간
ELAPSED_TIME=0			# 대기 경과 시간

if [ ! -d "/var/lib/mysql/${MARIADB_NAME}" ]; then
    sleep 2

		# 초기 데이터베이스 생성
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_NAME};"
	echo "Database create"

	# 사용자 생성 및 권한 부여
	mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
	echo "Create user"
	mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'%';"
	echo "Grant user"

	# 변경 사항 적용
	mysql -e "FLUSH PRIVILEGES;"
	echo "Privileges user"

	if [ $? -eq 0 ]; then
		echo "[$0] Completed init mariadb"
		service mariadb stop
		exit 0
	else
		echo "[$0] Failed init mariadb"
		exit 1
	fi

	exit 0
fi

ELAPSED_TIME=$((ELAPSED_TIME + WAIT_INTERVAL))
echo "[$0] Failed checking the normal active status of mariadb for mariadb init($ELAPSED_TIME/$MAX_WAIT)"


