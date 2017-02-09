#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/backup.sh [ service ]" 1> /dev/stderr
	exit 1
fi

mkdir -p ./backup

docker-compose exec $1 sh -c \
"mysqldump --all-databases --add-drop-table -u root -pcprt87 | gzip -c -9 > /backup/$1.db.bak.sql.gz"

tar -c -O ./backup/$1 | gzip -c -9 > ./backup/$1.wp.bak.tar.gz
