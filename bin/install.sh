#!/bin/sh

if [ -z $1 ]
then
	echo "usage: ./bin/install.sh [ service ]" 1> /dev/stderr
	exit 1
fi

docker-compose up --build -d $1
