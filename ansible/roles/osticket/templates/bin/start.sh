#! /bin/bash
cd $(dirname $0)

. log_utils

cd ..
application_name=${PWD##*/}
log_logging_application="MGM/${application_name}"

export DOCKER_CTX={{ docker_ctx | default('/docker') }}

if [ ! -e  ${DOCKER_CTX}/etc/${application_name}/application.cfg ]
then
    log_fatal 91 "${DOCKER_CTX}/etc/${application_name}/application.cfg does not exist ..."
fi

. ${DOCKER_CTX}/etc/${application_name}/application.cfg

if [[ -z ${DOCKER_VOLUMES+x} ]]
then
   log_fatal 92 "DOCKER_VOLUMES not defined in ${DOCKER_CTX}/etc/${application_name}/application.cfg" 
fi	    


export VOLUMES_CTX=${DOCKER_CTX}/var/volumes/${application_name}

if [ -z "$VOLUMES_CTX" ]
then
    log_warn "No docker volumes defined for aplication ${application_name}"
else
    for volume in ${DOCKER_VOLUMES}
    do
	if [ ! -d ${VOLUMES_CTX}/${volume} ]
	then
	    if sudo mkdir -p ${VOLUMES_CTX}/${volume}
	    then
		log_info "Created empty volume directory ${volume}"
	    else
		log_fatal 93 "Failed to created empty volume directory ${volume}"
	    fi
	    
	fi
    done
fi

cd ${DOCKER_CTX}/etc/${application_name}

export CURRENT_USER=$(id -u):$(id -g)

log_info "Starting docker application ${application_name}"
docker-compose up -d


