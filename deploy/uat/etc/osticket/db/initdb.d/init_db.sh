#! /bin/bash

cd $(dirname $0)

db_to_seed="osticket"
db_seed_sql="./data/init.sql"

if mysql --user root --password="${MYSQL_ROOT_PASSWORD}" -e "use ${db_to_seed}" 2 > /dev/null
then
    echo "db ${db_to_seed} exists - no need to seed"
    exit 0
else
    echo "seeding db ${db_to_seed} with ${db_seed_sql}"
    if [ -e ${db_seed_sql} ]
    then
	mysql --user root --password=${MYSQL_ROOT_PASSWORD} < ${db_seed_sql}
    else
	echo "Unable to seed db ${db_to_seed} -  ${db_seed_sql} does not exist"
	exit 9
    fi
fi
