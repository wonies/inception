FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y nginx openssl gettext vim

COPY ./tools/script.sh /tmp/script.sh
COPY ./conf/default /etc/nginx/sites-enabled/default
RUN chmod +x /tmp/script.sh
RUN chmod +x /etc/nginx/sites-enabled/default
EXPOSE 80
ENTRYPOINT ["/tmp/script.sh"]

CMD ["nginx", "-g", "daemon off;"]