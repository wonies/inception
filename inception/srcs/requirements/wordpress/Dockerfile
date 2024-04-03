# FROM debian:bullseye
# RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php php-mysql php-mysqli mariadb-client curl
# COPY ./tools/script.sh /tmp/script.sh
# WORKDIR /var/www/html
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp-cli.phar && \
#     echo '#!/bin/sh' >> /usr/local/bin/wp && \
#     echo 'wp-cli.phar "$@" --allow-root' >> /usr/local/bin/wp && \
#     chmod +x /usr/local/bin/wp
# # RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# # RUN chmod +x wp-cli.phar
# # RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --allow-root && wp plugin install woocommerce --activate --allow-root
# RUN chmod +x /tmp/script.sh
# RUN apt-get install -y dumb-init
# EXPOSE 8000
# ENTRYPOINT [ "/tmp/script.sh" ]
# CMD ["php-fpm", "-F"]

FROM debian:bullseye

# 필요한 패키지 설치
# RUN apt-get update -y && apt-get upgrade -y \
#     && apt-get install -y \ 
#     php \ 
#     php-mysql \ 
#     php-mysqli \
#     mariadb-client \
#     curl \
#     sudo \
#     vim \
#     php-fpm \
#     && apt-get upgrade -y
# COPY ./tools/script.sh /tmp/script.sh

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	php \
	php-fpm \
	php-mysql \
	curl \
    mariadb-client
COPY ./tools/script.sh /tmp/script.sh

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php && usermod -G www-data -a www-data && chmod -R 755 /run/php
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html
# WP-CLI 설치
# WORKDIR /usr/local/bin
WORKDIR /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN chmod +x /tmp/script.sh

RUN apt-get install -y dumb-init

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# 스크립트 복사 및 실행 권한 설정
# 포트 열기 및 시작 명령 설정`
EXPOSE 9000
ENTRYPOINT [ "/tmp/script.sh" ]
# CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
# php모드를 포어그라운드에서 실행하라는 의미`
#CMD ["php-fpm7.4",  "-F"]
# CMD ["php",-F "-S"]
