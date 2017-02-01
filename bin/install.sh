#!/bin/sh

if [ -z $1 ]
then
	echo "usage: ./bin/install.sh [ service ]" 1> /dev/stderr
	exit 1
fi

if [ ! -f ./backup/wp.tar.gz ] || [ ! -f ./backup/$1 ]
	then
		curl -o ./backup/wp.tar.gz https://wordpress.org/latest.tar.gz
		tar -xzf ./backup/wp.tar.gz -C ./backup
		mv ./backup/wordpress ./backup/$1
fi
docker-compose up --build -d $1
