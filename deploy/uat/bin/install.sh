#! /bin/bash

cd $(dirname $0)
. utils.sh
cd ..

[ ! -e ./deployment.cnf ] &&  log_fatal 90 "./deployment.cnf file not found"

export $(grep -v '^#' ./deployment.cnf | xargs)

[ -z "$DEPLOYMENT_HOST" ] &&  log_fatal 91 "DEPLOYMENT_HOST not in ./deployment.cnf file" 
[ -z "$APPLICATION_SETTINGS_DIR" ] &&  log_fatal 92 "APPLICATION_SETTTINGS_DIR not in ./deployment.cnf file" 
[ -z "$APPLICATION_NAME" ] &&  log_fatal 93 "APPLICATION_NAME not in ./deployment.cnf file" 

cd settings

[ ! -d $APPLICATION_NAME ] &&  log_fatal 94 "$APPLICATION_NAME is not a direcotry in $(pwd)"

echo "rsync -azP --delete ${APPLICATION_NAME} ${DEPLOYMENT_HOST}:${APPLICATION_SETTINGS_DIR}"
