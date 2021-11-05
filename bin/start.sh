#! /bin/bash

cd $(dirname $0)
. utils.sh
cd ..

if [ ! -d .root/var/www/html ]
then
    mkdir -p .root/var/www/html
fi

CURRENT_USER=$(id -u):$(id -g) docker-compose up
