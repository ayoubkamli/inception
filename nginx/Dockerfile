FROM debian:buster-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl            \
        git             \
        tree            \
        unzip           \
        vim             \
        wget            \
        nginx           \
    && rm -rf /var/lib/apt/lists/*

COPY ./ca-script.sh .
COPY ./default.conf .

EXPOSE 80 443

ENTRYPOINT sh "./ca-script.sh"

CMD /usr/sbin/nginx -g "daemon off;"
