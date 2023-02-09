FROM alpine:3.12

RUN apk update && \
    apk add mariadb mariadb-client

COPY setup-db.sh /setup-db.sh
RUN chmod +x /setup-db.sh

EXPOSE 3306

CMD ["sh", "/setup-db.sh && mysql -u root < /setup-db.sh && mysqld"]
