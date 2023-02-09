FROM alpine:3.12

RUN apk update && \
    apk add php7 php7-fpm php7-mysqli wget

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz

RUN mkdir -p /var/www/html
RUN mv wordpress /var/www/html

COPY php-fpm.conf /etc/php7/php-fpm.conf

EXPOSE 9000

CMD ["php-fpm7"]
