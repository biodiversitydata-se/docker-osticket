#! /bin/bash
cd $(dirname $0)
. utils.sh
cd ..

export $(grep -v '^#' ./env | xargs)

[ -z "$MYSQL_HOST" ] &&  log_fatal 91 "MYSQL_HOST not in ./env file" 
[ -z "$MYSQL_DATABASE" ] &&  log_fatal 92 "MYSQL_DATABASE not in ./env file" 
[ -z "$MYSQL_ROOT_PASSWORD" ] &&  log_fatal 93 "MYSQL_ROOT_PASSWORD not in ./env file" 

cd .dockerfiles
docker exec $MYSQL_HOST mysqldump --user root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE > ${MYSQL_DATABASE}_dump.sql
mv -b ${MYSQL_DATABASE}_dump.sql ${MYSQL_DATABASE}.sql
