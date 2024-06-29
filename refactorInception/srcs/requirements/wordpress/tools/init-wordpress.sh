#!/bin/sh

if [ ! -f $WEB_SERVER_ROOT_DIR"wp-config.php" ]; then
    echo "[$0] start setting wordpress"
    cd $WEB_SERVER_ROOT_DIR

    wp core download --allow-root \
					--path=$WEB_SERVER_ROOT_DIR
    wp config create --dbname=$MARIADB_NAME \
					--dbuser=$MARIADB_USER \
					--dbpass=$MARIADB_PASSWORD \
					--dbhost=$WORDPRESS_DB_HOST \
					--path=$WEB_SERVER_ROOT_DIR \
					--allow-root
    wp core install --url=localhost \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN_NAME \
					--admin_password=$WORDPRESS_ADMIN_PASS \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--path=$WEB_SERVER_ROOT_DIR \
					--allow-root
    wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL \
					--user_pass=$WORDPRESS_USER_PASS \
					--role="author" \
					--path=$WEB_SERVER_ROOT_DIR \
					--allow-root
else
    echo "[$0] wordPress is already setting."
fi

echo "[$0] Completed setup wordpress"