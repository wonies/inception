#!/bin/sh

set -e
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






# export WORDPRESS_DB_NAME=wordpress
# export WORDPRESS_DB_USER=wonie
# export WORDPRESS_DB_PASS=0000
# export WORDPRESS_DB_HOST=mariadb
# export WORDPRESS_DB_TITLE=wordpress
# export WORDPRESS_ADMIN_NAME=wonhshin
# export WORDPRESS_ADMIN_EMAIL=wonhshin@student.ko
# export WORDPRESS_ADMIN_PASS=0000
# export WORDPRESS_USER_NAME=user
# export WORDPRESS_USER_EMAIL=user@aa.bbc
# export WORDPRESS_USER_PASS=0000


# echo "==== start wordpress ===="


# # sed -i "s/;listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/g" /etc/php/fpm/pool.d/www.conf
# if ! wp core is-installed --path=$WORDPRESS_PATH --allow-root; then
#     wp core download --path=$WORDPRESS_PATH --allow-root
#     sleep 3
#     wp config create --dbname=$WORDPRESS_DB_TITLE --dbuser=$WORDPRESS_DB_NAME --dbpass=$WORDPRESS_DB_PASS --dbhost=$WORDPRESS_DB_HOST --dbcharset="utf8" --allow-root  --path=$WORDPRESS_PATH
#     wp core install --url=inception --title=mariadb --admin_user=wonhshin --admin_password=1234 --admin_email=wonhshin@st.ac.kr --path=$WORDPRESS_PATH --allow-root
#     wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PWD --allow-root --path=$WORDPRESS_PATH
#     wp plugin update --all
#     # 추가 명령 실행
# elses
#     echo "WordPress is already installed."
# fi
# # wp core download --path=/var/www/html --allow-root
# # wp-config.php 생성

# # sleep 5

# # wp config create --dbname=$WORDPRESS_DB_TITLE --dbuser=$WORDPRESS_DB_NAME --dbpass=$WORDPRESS_DB_PASS --dbhost=$WORDPRESS_DB_HOST --dbcharset="utf8" --allow-root --path=/var/www/html
# # WordPress 설치


# # wp core install --url=inception --title=mariadb --admin_user=wonhshin --admin_password=1234 --admin_email=wonhshin@st.ac.kr --allow-root --path=/var/www/html
# # if ! wp core is-installed --allow-root; then
# #     wp core download --path=/var/www/html --allow-root
# #     wp config create --dbname=... --allow-root
# #     wp core install --url=... --allow-root
# #     # 추가 명령 실행
# # else
# #     echo "WordPress is already installed."
# # fi
# # wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PWD --allow-root
# # wp plugin update --all
# # echo "---plugin-----"
# mkdir /run/php
# chown www-data /run/php

# # sed -i 's/listen = \/run\/php\/php-fpm.sock/listen = 9000/g' /etc/php/fpm/pool.d/www.conf

# # sed -i "s/listen = \/run\/php\/php-fpm.sock/listen = 0.0.0.0:$WORDPRESS_PORT/g" /etc/php/fpm/pool.d/www.conf
# # echo "==== end wordpress ===="
# /usr/sbin/php-fpm7.4 -F

# script.sh

# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:8000/g" /etc/php/8.2.17/fpm/pool.d/www.conf
# export WORDPRESS_DB_NAME=wordpress
# export WORDPRESS_DB_USER=wonie
# export WORDPRESS_DB_PASSWORD=0000
# export WORDPRESS_DB_HOST=mariadb


# export WORDPRESS_DB_HOST=mariadb

mkdir -p /run/php && chown -R www-data:www-data /run/php && usermod -G www-data -a www-data && chmod -R 755 /run/php
mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

echo "==== start wordpress ===="
# mkdir -p /run/php
# mkdir /var/www/html
# cd /var/www/html
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp
# rm -rf *

sleep 3
if [ ! -f "/var/www/html/wp-config.php" ]; then
# wp core is-installed --path=/var/www/html --allow-root; then

    echo "Installing WordPress..."
    cd /var/www/html
    chmod -R 755 /var/www/html

    # sleep 3
    wp core download --allow-root --path=/var/www/html
    echo "------1------"
    echo "waiting config"
    wp config create --dbname=$MARIADB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --path=/var/www/html --allow-root
    wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WORDPRESS_ADMIN_NAME --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL --path=/var/www/html --allow-root
    wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASS --role="author" --path=/var/www/html --allow-root
else
    echo "WordPress is already installed."
fi
# which php7.4-fpm
echo "==== WordPress setup completed ===="
# php7.4-fpm -F
# /usr/sbin/php-fpm -F
#unterminated quoted string 


# mkdir /run/php

# /usr/sbin/php-fpm7.4 -F

# exec "$@"
php-fpm7.4 -F
# /bin/bash
