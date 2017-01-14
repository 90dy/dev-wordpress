#!/bin/sh

if [ -z $1 ]
then
	echo "usage: ./bin/reinstall.sh [ service ]" 1> /dev/stderr
	exit 1
fi

./bin/backup.sh $1

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

./bin/install.sh $1

./bin/restore.sh $1
