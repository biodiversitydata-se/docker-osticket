#! /bin/bash

cd $(dirname $0)
. utils.sh
cd ../../..
export DOCKER_CTX=$(pwd)
application_name='osticket'

if [ ! -d ./var/volumes/osticket_mysql ]
then
    sudo mkdir ./var/volumes/osticket_mysql
fi

if [ ! -d ./var/volumes/osticket_osticket ]
then
    sudo mkdir ./var/volumes/osticket_osticket
fi

if [ ! -d ./var/volumes/osticket_osticket_src ]
then
    mkdir ./var/volumes/osticket_osticket_src
fi

export CURRENT_USER=$(id -u):$(id -g)

cd etc/${application_name}

docker-compose up -d
