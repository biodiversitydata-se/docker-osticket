#! /bin/bash

cd $(dirname $0)
cd ../../..

export DOCKER_CONTEXT=$(pwd)
#export CURRENT_USER=$(id -u):$(id -g)

cd etc/osticket

docker-compose down
