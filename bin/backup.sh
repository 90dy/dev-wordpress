#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/backup.sh [ service ]" 1> /dev/stderr
	exit 1
fi

mkdir -p ./backup

docker exec -it pianissimes_$1_1 /bin/sh -c \
"mysqldump --all-databases --add-drop-table -u root -pcprt87 | gzip -c -9 > /backup/$1.db.bak.sql.gz"

docker exec -it pianissimes_$1_1 /bin/sh -c \
"cd /usr/share && tar -c -O wordpress | gzip -c -9 > /backup/$1.wp.bak.tar.gz"
