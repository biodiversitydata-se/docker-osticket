#! /bin/bash
cd $(dirname $0)
. utils.sh
cd ..
export DOCKER_CTX=$(pwd)
cd ..

# TBD: fix this with BACKUP_CONTEXT
export BACKUP_CONTEXT=${DOCKER_CTX}/backup

cd ${DOCKER_CTX}/etc/osticket

export $(grep -v '^#' env/.envosticket | xargs)

[ -z "$MYSQL_HOST" ] &&  log_fatal 91 "MYSQL_HOST not in ./env file" 
[ -z "$MYSQL_DATABASE" ] &&  log_fatal 92 "MYSQL_DATABASE not in ./env file" 
[ -z "$MYSQL_ROOT_PASSWORD" ] &&  log_fatal 93 "MYSQL_ROOT_PASSWORD not in ./env file" 


cd ${BACKUP_CONTEXT}
docker exec $MYSQL_HOST mysqldump --user root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE > ${MYSQL_DATABASE}_dump.sql
mv -b ${MYSQL_DATABASE}_dump.sql ${MYSQL_DATABASE}.sql
