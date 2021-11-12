#! /bin/bash

cd $(dirname $0)
. utils.sh
cd ..
export DOCKER_MOUNT=$(pwd)

if [ ! -d ./var/volumes/osticket_mysql ]
then
    mkdir ./var/volumes/osticket_mysql
fi

if [ ! -d ./var/volumes/osticket_osticket ]
then
    mkdir ./var/volumes/osticket_osticket
fi

if [ ! -d ./var/volumes/osticket_osticket_src ]
then
    mkdir ./var/volumes/osticket_osticket_src
fi

export CURRENT_USER=$(id -u):$(id -g)

cd etc/osticket

docker-compose up
