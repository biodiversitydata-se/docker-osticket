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

cd etc/${application_name}

docker-compose up -d
