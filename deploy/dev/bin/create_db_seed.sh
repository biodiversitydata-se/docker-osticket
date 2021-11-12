#! /bin/bash
cd $(dirname $0)
pwd
. utils.sh
cd ..
export DOCKER_CTX=$(pwd)

cd ${DOCKER_CTX}/etc/osticket

export $(grep -v '^#' env/.envosticket | xargs)

[ -z "$MYSQL_HOST" ] &&  log_fatal 91 "MYSQL_HOST not in ./env file" 
[ -z "$MYSQL_DATABASE" ] &&  log_fatal 92 "MYSQL_DATABASE not in ./env file" 
[ -z "$MYSQL_ROOT_PASSWORD" ] &&  log_fatal 93 "MYSQL_ROOT_PASSWORD not in ./env file" 



#cd ${DOCKER_CONTEXT}/etc/osticket/db/initdb.d

init_sql_file=${DOCKER_CTX}/etc/osticket/db/initdb.d/init.sql

echo "CREATE DATABASE  IF NOT EXISTS \`osticket\` /*!40100 DEFAULT CHARACTER SET utf8 */;" > ${init_sql_file}
echo "USE \`osticket\`;" >>  ${init_sql_file}


docker exec "${MYSQL_HOST}" /usr/bin/mysqldump -u root --password="${MYSQL_ROOT_PASSWORD}" "${MYSQL_DATABASE}" >> "${init_sql_file}"




