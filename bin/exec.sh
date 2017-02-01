#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/exec.sh [ service ]" 1> /dev/stderr
	exit 1
fi

docker-compose exec $1 bash
