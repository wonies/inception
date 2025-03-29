# 🏗️ Inception
> A system administration & DevOps project using Docker and Docker Compose.  
> Build a secure, scalable, and containerized web service from scratch.

---

![Inception Architecture](./inception_architecture.png)

---

## 📦 프로젝트 개요

> **이 프로젝트는 가상 머신(VM) 위에서 Docker를 사용해 웹 서비스를 구성하는 과제로, '가상화 위의 가상화'를 경험해보는 클라우드 컴퓨팅 기반 DevOps 학습 프로젝트입니다.**

- 직접 Dockerfile을 작성하여 이미지를 구현하고, 이를 통해 서비스를 구성해야 함
- 데이터베이스(**MariaDB**), CMS 웹페이지(**WordPress**), 서버(**Nginx**)를 Docker 컨테이너로 각각 구현
- 단순 이미지 다운이 아닌, **직접 빌드한 이미지로 서비스 운영**
- `.env` 기반 설정을 통해 보안성과 유연성을 확보

🔗 참고: [클라우드 컴퓨팅 / 컨테이너 기술과 도커](https://www.notion.so/d1af565f2db3492cb27982a763a65bc0?pvs=21)

---

## 🧱 사용 기술
| 역할 | 도구 |
|------|------|
| OS | Debian (기반 Linux 이미지) |
| Web Server | Nginx + SSL (OpenSSL) |
| CMS | WordPress + WP-CLI |
| DB | MariaDB |
| DevOps | Docker, Docker Compose |
| 언어 | Shell Script, PHP, SQL |

---

## ⚙️ 서비스 구성도

```plaintext
                     +----------------------+
                     |     Your Domain      |
                     +----------+-----------+
                                |
                                v
                          +-----------+
                          |   Nginx   |
                          +-----+-----+
                                |
       +------------------------+------------------------+
       |                                                 |
+------+-------+                                     +---+------------+
|   WordPress  | <------ Persistent Volume ------>   |    MariaDB     |
+--------------+                                     +----------------+
```

---

## 📸 시연 화면

### ✅ MariaDB 정상 작동 및 데이터 확인
![MariaDB 테이블 확인](./mariadb_status.png)

### ✅ WordPress 로그인 화면 (HTTPS 인증서 경고)
![WordPress 로그인](./wp_login_https_warning.png)

### ✅ WordPress 관리자 페이지 접속
![WordPress Dashboard](./wp_dashboard_https.png)

---

## 🧩 구현 상세

### 🔹 MariaDB
- 기본 설치 후 데이터 디렉토리 `/var/lib/mysql` 을 마운트
- `script.sh`를 통해 DB 자동 생성 및 유저 설정
- `mysqld_safe`로 안정적 실행

```sh
CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';
```

### 🔹 WordPress
- WP-CLI를 사용하여 자동 설치 및 초기 설정
- 관리자 계정과 일반 사용자 계정 생성
- MariaDB와 연결되도록 `.env` 기반 설정 적용
- `/var/www/html` 경로에 퍼시스턴트 볼륨 사용

```sh
wp core download
wp config create --dbname=... --dbuser=...
wp core install --url=... --admin_user=... 
```

### 🔹 Nginx
- HTTPS(SSL) 인증서 직접 생성 (`openssl`)
- `/etc/ssl/certs`, `/etc/ssl/private`에 pem/crt 저장
- `fastcgi_pass`로 WordPress PHP-FPM과 연결 (port 9000)
- 설정파일 `/etc/nginx/sites-enabled/default` 사용

---

## ⚙️ Docker 설정 요약

### 📁 .env
```dotenv
DOMAIN_NAME=wonhshin.42.fr
MARIADB_ROOT_PASSWORD=0000
MARIADB_NAME=wordpress
MARIADB_USER=wonhshin
MARIADB_PASSWORD=0000
WORDPRESS_DB_HOST=mariadb
WORDPRESS_ADMIN_NAME=wonhshin
WORDPRESS_ADMIN_PASS=0000
... (기타 설정)
```

### 📄 docker-compose.yml
```yaml
services:
  mariadb:
    build: ./requirements/mariadb
    volumes:
      - db:/var/lib/mysql
  wordpress:
    build: ./requirements/wordpress
    depends_on:
      - mariadb
    volumes:
      - web:/var/www/html
  nginx:
    build: ./requirements/nginx
    ports:
      - "443:443"
    depends_on:
      - wordpress
    volumes:
      - web:/var/www/html
```

### 🗂️ Volumes
```yaml
volumes:
  db:
    driver_opts:
      device: /home/wonhshin/data/db
  web:
    driver_opts:
      device: /home/wonhshin/data/web
```

---

## 🚀 실행 방법

```bash
# 전체 빌드 및 실행
docker-compose up --build

# 종료 및 정리
docker-compose down
```

---

## 💡 학습 포인트
- Nginx + PHP-FPM 연동 방법
- OpenSSL로 인증서 생성 및 HTTPS 적용
- WP-CLI로 자동 설정 스크립트 구성
- Dockerfile로 서비스별 환경 분리
- .env를 통한 변수 관리 및 보안 구성
- VM 위에서 Docker 구동 → 클라우드/가상화 개념에 대한 실습 이해

---

## 👤 작성자
- wonies
