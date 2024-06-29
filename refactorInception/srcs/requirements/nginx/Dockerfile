FROM debian:bullseye

# 패키지 업데이트 및 필요 패키지 설치
RUN apt-get update -y \
	&& apt-get install -y \
		nginx \
		openssl
		# gettext
		
# SSL 인증서 생성
ARG SSL_KEY_ROOT="/etc/ssl/private/nginx.pem"
ARG SSL_CERTIFICATION_ROOT="/etc/ssl/certs/nginx.crt"
RUN openssl req -newkey rsa:2048 \
				-days 365 \
				-nodes \
				-x509 \
				-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42seoul/CN=youjeong@student.42seoul.kr" \
				-keyout ${SSL_KEY_ROOT} \
				-out ${SSL_CERTIFICATION_ROOT}

COPY ./conf/default /etc/nginx/sites-enabled/default

RUN chmod +x /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]