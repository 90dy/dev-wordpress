#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/restore.sh [ service ]" 1> /dev/stderr
	exit 1
fi

docker-compose exec $1 sh -c \
"gunzip -c /backup/$1.db.bak.sql.gz | mysql -u root -pcprt87"

sudo tar -xf ./backup/$1.wp.bak.tar.gz -C .

docker-compose exec $1 sh -c \
"chown -R www-data:www-data /usr/share/wordpress"
