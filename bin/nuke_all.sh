#!/bin/bash
cd $(dirname $0)
. utils.sh
cd ..



# To start fresh with all docker imges and containers gone...
# Thanks to: https://techoverflow.net/2013/10/22/docker-remove-all-images-and-containers/

name_key='osticket'

# Stop all containers
./stop.sh
# Delete all containers
docker rm $(docker ps -a | grep $name_key | awk '{print $1}')
# Delete all images
if ! docker rmi $(docker images | grep $name_key | awk '{print $1}')
then
    docker rmi -f $(docker images | grep $name_key | awk '{print $3}')
fi

# Remove all volumes
docker volume rm $(docker volume ls | grep $name_key | awk '{print $2}')

# Remove all file system data
if [ -d .root/var/lib/mysql ]
then
    pushd .root/var/lib/mysql
    rm -rf *
    popd
fi

if [ -d .root/var/www/html ]
then
    pushd .root/var/www
    # TODO: Try to fix this so that current user owns these files...
    sudo rm -rf html     
    popd
fi
