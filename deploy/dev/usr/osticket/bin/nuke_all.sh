#!/bin/bash
# Start fresh with all docker imges, containers and volumes gone...

cd $(dirname $0)
. utils.sh
cd ../../..
export DOCKER_CTX=$(pwd)

application_name='osticket'
name_key=${application_name}

echo "Stopping all containers"
./usr/${application_name}/bin/stop.sh

echo "Deleting all containers"
docker rm $(docker ps -a | grep "_${name_key}" | awk '{print $1}')

echo "Deleting all images"
if ! docker rmi $(docker images | grep "${name_key}" | awk '{print $1}')
then
    docker rmi -f $(docker images | grep "${name_key}" | awk '{print $3}')
fi

echo "Removing all volumes"
docker volume rm $(docker volume ls | grep "${name_key}_" | awk '{print $2}')

echo "Removing all file system (volume) data"
sudo rm -rf ./var/volumes/${application_name}_*



