#! /bin/bash

cd $(dirname $0)
cd ..
CURRENT_USER=$(id -u):$(id -g) docker-compose down
