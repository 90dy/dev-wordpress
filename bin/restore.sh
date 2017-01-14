#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/restore.sh [ service ]" 1> /dev/stderr
	exit 1
fi

docker exec -it pianissimes_$1_1 /bin/sh -c \
"gunzip -c /backup/$1.db.bak.sql.gz | mysql -u root -pcprt87"

docker exec -it pianissimes_$1_1 /bin/sh -c \
"tar -xf /backup/$1.wp.bak.tar.gz -C /usr/share && chown -R www-data:www-data /usr/share/wordpress"
