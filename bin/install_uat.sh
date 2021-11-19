#! /bin/bash

cd $(dirname $0)
. log_utils
cd ..

application_name=osticket

deployment_target="uat" # or "prod" or "dev?"
deployment_src_dir=$(pwd)/deploy/${deployment_target}
deployment_config=${deployment_src_dir}/etc/${application_name}/deploy/deployment.cnf

# Check that deployment configuration exists 
[ ! -e "${deployment_config}" ] &&  log_fatal 9 "Deployment config (${deployment_config}) does not exist"


# Read deployment parameters:
#export $(grep -v '^#' "${deployment_config}" | xargs)
. ${deployment_config}

# Check that all needed deployment parameters are set: 
[ -z "$DEPLOYMENT_HOST" ] &&  log_fatal 91 "DEPLOYMENT_HOST not in ${deployment_config}" 
[ -z "$DEPLOYMENT_USER" ] &&  log_fatal 92 "DEPLOYMENT_USER not in ${deployment_config}" 
[ -z "$DEPLOYMENT_TARGET_DIR" ] &&  log_fatal 93 "DEPLOYMENT_TARGET_DIR not in ${deployment_config}" 

# Check that application docker dir exists on host:
ssh  ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST} "[ ! -d ${DEPLOYMENT_TARGET_DIR} ]" && log_fatal 81 "${DEPLOYMENT_TARGET_DIR} does not exist on application host" 



# Ensure basic directory structure on deployment host:
target_etc_dir=${DEPLOYMENT_TARGET_DIR}/etc/${application_name}
target_usr_dir=${DEPLOYMENT_TARGET_DIR}/usr/${application_name}
target_volumes_dir=${DEPLOYMENT_TARGET_DIR}/var/volumes
target_backup_dir=${DEPLOYMENT_TARGET_DIR}/var/backup/${application_name}

ssh -t ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST} "sudo mkdir -p ${target_etc_dir} && sudo chown ${DEPLOYMENT_USER}. ${target_etc_dir}"
ssh -t ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST} "sudo mkdir -p ${target_usr_dir} && sudo chown ${DEPLOYMENT_USER}. ${target_usr_dir}"
ssh -t ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST} "sudo mkdir -p ${target_volumes_dir} && sudo chown ${DEPLOYMENT_USER}. ${target_volumes_dir}"
ssh -t ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST} "sudo mkdir -p ${target_backup_dir} && sudo chown ${DEPLOYMENT_USER}. ${target_backup_dir}"

cd ${deployment_src_dir}

# Install files under etc:
pushd etc
rsync -azP --delete --exclude '\.git*' --exclude '*~' ${application_name} ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST}:${DEPLOYMENT_TARGET_DIR}/etc
popd

# Install files under usr if they exist:
if [ -d usr/${application_name} ]
then
    pushd usr
    rsync -azP --delete --exclude '\.git*' --exclude '*~' ${application_name} ${DEPLOYMENT_USER}@${DEPLOYMENT_HOST}:${DEPLOYMENT_TARGET_DIR}/usr
    popd
fi


    
    
