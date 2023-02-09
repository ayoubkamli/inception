#!/bin/sh

set -e

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  echo >&2 'error: database is uninitialized and password option is not specified '
  echo >&2 '  You need to specify MYSQL_ROOT_PASSWORD in your environment'
  exit 1
fi

if [ -z "$MYSQL_DATABASE" ]; then
  echo >&2 'error: MYSQL_DATABASE is not specified'
  exit 1
fi

if [ -z "$MYSQL_USER" ]; then
  echo >&2 'error: MYSQL_USER is not specified'
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo >&2 'error: MYSQL_PASSWORD is not specified'
  exit 1
fi

echo "=> Creating database $MYSQL_DATABASE"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
EOSQL

echo "=> Done!"
