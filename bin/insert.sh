#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/insert.sh [ service ]" 1> /dev/stderr
	exit 1
fi

cd ./$1; tar -c -O wordpress | gzip -c -9 > ../backup/$1.wp.bak.tar.gz

