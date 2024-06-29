FROM debian:bullseye

ARG WEB_SERVER_ROOT_DIR=/var/www/html/
ENV WEB_SERVER_ROOT_DIR=${WEB_SERVER_ROOT_DIR}

# 패키지 업데이트 및 필요 패키지 설치
RUN apt-get update \
	&& apt-get install -y \
		php \
		php-fpm \
		php-mysql \
		curl \
		mariadb-client \
		tini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/ /tools/
RUN chmod +x /tools/*

# PHP-FPM에 필요한 디렉터리 생성 및 권한 설정
RUN mkdir -p /run/php \
	&& chown -R www-data:www-data /run/php \
	&& usermod -G www-data -a www-data \
	&& chmod -R 755 /run/php
# 웹 서버 루트 디렉터리 생성 및 권한 설정
RUN mkdir -p ${WEB_SERVER_ROOT_DIR} \
	&& chown -R www-data:www-data ${WEB_SERVER_ROOT_DIR} \
	&& chmod -R 755 ${WEB_SERVER_ROOT_DIR}
# wp-cli 다운로드 및 실행할 수 있는 스크립트 download
# reference : https://make.wordpress.org/cli/handbook/guides/installing/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

# PHP-FPM의 설정 파일에서 UNIX 소켓 대신 TCP 포트를 사용하도록 설정
# ARG ORIGIN_STR="listen = \/run\/php\/php7.4-fpm.sock"
# ARG TARGET_STR="listen = 0.0.0.0:9000"
# ARG TARGET_FILE="/etc/php/7.4/fpm/pool.d/www.conf"
# RUN sed -i "s/${ORIGIN_STR}/${TARGET_STR}/g" ${TARGET_FILE}
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
WORKDIR /tools/

# tini로 entrypoint 정의
ENTRYPOINT ["/usr/bin/tini", "--"]

# 컨테이너 실행 시 wordpress 초기화 스크립트 실행 및 PHP FastCGI Process Manager를 실행
CMD /bin/sh init-wordpress.sh && php-fpm7.4 -F

# PHP-FPM Health Check 추가
HEALTHCHECK --interval=5s --timeout=3s \
    CMD php-fpm7.4 -t || exit 1