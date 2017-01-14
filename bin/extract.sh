#!/bin/sh
if [ -z "$1" ]
then
	echo "usage: ./bin/extract.sh [ service ]" 1> /dev/stderr
	exit 1
fi

mkdir -p $1
tar -xf ./backup/$1.wp.bak.tar.gz -C $1

