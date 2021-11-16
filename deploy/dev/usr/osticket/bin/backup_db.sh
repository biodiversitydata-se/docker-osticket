#! /bin/bash
cd $(dirname $0)
. utils.sh
cd ../../..
export DOCKER_CTX=$(pwd)
application_name='osticket'

export BACKUP_CTX=${DOCKER_CTX}/var/backup/${application_name}

[ ! -d ${BACKUP_CTX} ] && log_fatal 9 "No backup context (${BACKUP_CTX}) found" 

cd ${DOCKER_CTX}/etc/${application_name}

export $(grep -v '^#' env/.envosticket | xargs)

[ -z "$MYSQL_HOST" ] &&  log_fatal 91 "MYSQL_HOST not in ./env file" 
[ -z "$MYSQL_DATABASE" ] &&  log_fatal 92 "MYSQL_DATABASE not in ./env file" 
[ -z "$MYSQL_ROOT_PASSWORD" ] &&  log_fatal 93 "MYSQL_ROOT_PASSWORD not in ./env file" 


cd ${BACKUP_CTX}

docker exec $MYSQL_HOST mysqldump --user root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE > ${MYSQL_DATABASE}_dump.sql
mv -b ${MYSQL_DATABASE}_dump.sql ${MYSQL_DATABASE}.sql
