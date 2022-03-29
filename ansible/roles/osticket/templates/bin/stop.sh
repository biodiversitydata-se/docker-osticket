#! /bin/bash
cd $(dirname $0)

. log_utils

cd ..
application_name=${PWD##*/}
log_logging_application="MGM/${application_name}"

export DOCKER_CTX={{ docker_ctx | default('/docker') }}

cd ${DOCKER_CTX}/etc/${application_name}

export CURRENT_USER=$(id -u):$(id -g)

log_info "Stopping docker application ${application_name}"
docker-compose down


