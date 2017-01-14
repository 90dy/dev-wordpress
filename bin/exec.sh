#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/exec.sh [ service ]" 1> /dev/stderr
	exit 1
fi

docker exec -it pianissimes_"$1"_1 /bin/bash
