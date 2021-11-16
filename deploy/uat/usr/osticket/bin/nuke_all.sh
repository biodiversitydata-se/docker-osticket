#!/bin/bash
cd $(dirname $0)
. utils.sh
cd ../../..
export DOCKER_MOUNT=$(pwd)
# To start fresh with all docker imges, containers and volumes gone...

application_name='osticket'
name_key='osticket'

#Stop all containers
.usr/${application_name}/bin/stop.sh

echo "Deleting all containers"

docker rm $(docker ps -a | grep $name_key | awk '{print $1}')

echo "Deleting all images"
if ! docker rmi $(docker images | grep $name_key | awk '{print $1}')
then
    docker rmi -f $(docker images | grep $name_key | awk '{print $3}')
fi

echo "Removing all volumes"
docker volume rm $(docker volume ls | grep $name_key | awk '{print $2}')

echo "Removing all file system (volume) data"

if [ -d ./var/volumes/osticket_osticket ]
then
    echo "Removing var/volumes/osticket_osticket"
    sudo rm -rf ./var/volumes/osticket_osticket
fi

if [ -d ./var/volumes/osticket_mysql ]
then
    echo "Removing var/volumes/osticket_mysql"
    sudo rm -rf ./var/volumes/osticket_mysql
fi



