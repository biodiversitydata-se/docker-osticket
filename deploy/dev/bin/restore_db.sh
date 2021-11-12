#! /bin/bash
cd $(dirname $0)
. utils.sh

cd ..
export DOCKER_CONTEXT=$(pwd)
cd ..

# TBD: fix this with BACKUP_CONTEXT
export BACKUP_CONTEXT=$(pwd)/backup

cd ${DOCKER_CONTEXT}/etc/osticket

export $(grep -v '^#' env/.envosticket | xargs)

[ -z "$MYSQL_HOST" ] &&  log_fatal 91 "MYSQL_HOST not in ./env file" 
[ -z "$MYSQL_DATABASE" ] &&  log_fatal 92 "MYSQL_DATABASE not in ./env file" 
[ -z "$MYSQL_ROOT_PASSWORD" ] &&  log_fatal 93 "MYSQL_ROOT_PASSWORD not in ./env file" 



cd ${BACKUP_CONTEXT}

[ ! -e "${MYSQL_DATABASE}.sql" ] &&  log_fatal 81 "${MYSQL_DATABASE}.sql does not exist"

docker exec -i $MYSQL_HOST mysql --user root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < ${MYSQL_DATABASE}.sql


