#!/bin/sh

if [ -z $1 ]
then
	echo "usage: ./bin/install.sh [ service ]" 1> /dev/stderr
	exit 1
fi

if [ ! -e ./backup/wp.tar.gz ]
	then
		curl -o ./backup/wp.tar.gz https://wordpress.org/latest.tar.gz
fi

if [ ! -e ./backup/$1 ]
	then
		tar -xzf ./backup/wp.tar.gz -C ./backup
		mv ./backup/wordpress ./backup/$1
fi

docker-compose up --build -d $1
