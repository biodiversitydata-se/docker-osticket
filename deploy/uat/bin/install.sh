#! /bin/bash

cd $(dirname $0)
. utils.sh
cd ..

[ ! -e ./deployment.cnf ] &&  log_fatal 90 "./deployment.cnf file not found"

export $(grep -v '^#' ./deployment.cnf | xargs)

[ -z "$DEPLOYMENT_HOST" ] &&  log_fatal 91 "DEPLOYMENT_HOST not in ./deployment.cnf file" 
[ -z "$DEPLOYMENT_USER" ] &&  log_fatal 92 "DEPLOYMENT_USER not in ./deployment.cnf file" 
[ -z "$APPLICATION_DOCKER_DIR" ] &&  log_fatal 93 "APPLICATION_DOCKER_DIR not in ./deployment.cnf file" 
[ -z "$APPLICATION_NAME" ] &&  log_fatal 94 "APPLICATION_NAME not in ./deployment.cnf file" 

cd etc

[ ! -d $APPLICATION_NAME ] &&  log_fatal 95 "$APPLICATION_NAME is not a direcotry in $(pwd)"

rsync -azP --delete --exclude '\.git*' ${APPLICATION_NAME} ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST}:${APPLICATION_DOCKER_DIR}/etc


cd ..
if [ -d usr ]
then
    cd usr
    [ ! -d $APPLICATION_NAME ] &&  log_fatal 95 "$APPLICATION_NAME is not a direcotry in $(pwd)"
    rsync -azP --delete --exclude '\.git*' ${APPLICATION_NAME} ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST}:${APPLICATION_DOCKER_DIR}/usr
fi

    
    
