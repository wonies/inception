FROM debian:bullseye

# 패키지 업데이트 및 필요 패키지 설치
RUN apt-get update \
	&& apt-get install -y \
		mariadb-server \
		systemctl \
		tini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/ /tools/
RUN chmod +x /tools/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY --chmod=755 tools/healthcheck.sh /scripts/healthcheck.sh
RUN chown -R mysql:mysql /etc/mysql/mariadb.conf.d
RUN chmod -R 755 /etc/mysql/mariadb.conf.d
RUN chown -R mysql:mysql /var/*
RUN chmod -R 755 /var/*

WORKDIR /tools/

# tini로 entrypoint 정의
ENTRYPOINT ["/usr/bin/tini", "--"]

# 컨테이너 실행 시 MariaDB 초기화 스크립트 실행 및 MariaDB 시작
CMD /bin/sh init-mariadb.sh && mysqld_safe

# HEALTHCHECK 정의
HEALTHCHECK --interval=3s --timeout=10s --start-period=1s --retries=3 \
	CMD /scripts/healthcheck.sh
