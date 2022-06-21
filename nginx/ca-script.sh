#!/bin/sh
export DOMAIN_NAME=akamli.42.fr
echo "${DOMAIN_NAME} script launched"
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gun/CN=${DOMAIN_NAME}/emailAddress=akamli@gmail.com" \
		-keyout /etc/nginx/ssl/${DOMAIN_NAME}.key \
		-out /etc/nginx/ssl/${DOMAIN_NAME}.crt
	chmod 600 /etc/nginx/ssl/${DOMAIN_NAME}.crt /etc/nginx/ssl/${DOMAIN_NAME}.key

mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.back
echo "copy nginx conf"
echo $?
mv ./default.conf /etc/nginx/nginx.conf
echo "replace nginx conf"
echo $?

service nginx reload
/usr/sbin/nginx -g "daemon off;"

exec $@
