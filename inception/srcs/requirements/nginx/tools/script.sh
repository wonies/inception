#!/bin/sh

set -e
# while true; do
# sleep 60 # 60초 마다 잠시 대기
# done

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42seoul/CN=wonhshin@student.42seoul.kr" -keyout /etc/ssl/private/nginx.pem -out /etc/ssl/certs/nginx.crt

exec "$@"