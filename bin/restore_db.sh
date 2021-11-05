#! /bin/bash
cd $(dirname $0)
. utils.sh
cd ..

export $(grep -v '^#' ./env | xargs)

[ -z "$MYSQL_HOST" ] &&  log_fatal 91 "MYSQL_HOST not in ./env file" 
[ -z "$MYSQL_DATABASE" ] &&  log_fatal 92 "MYSQL_DATABASE not in ./env file" 
[ -z "$MYSQL_ROOT_PASSWORD" ] &&  log_fatal 93 "MYSQL_ROOT_PASSWORD not in ./env file" 
[ ! -e "${MYSQL_DATABASE}.sql" ] &&  log_fatal 81 "${MYSQL_DATABASE}.sql does not exist"

cd .dockerfiles
docker exec -i $MYSQL_HOST mysql --user root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < ${MYSQL_DATABASE}.sql


