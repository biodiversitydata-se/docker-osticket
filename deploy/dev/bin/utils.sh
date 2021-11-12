log_fatal()
{
    __log_log crit "FATAL" $@
    # If first argument is an integer > 0 
    #     - exit with this integer as exit code
    [ $1 -gt 0 2> /dev/null ] && exit $1
}

log_error()
{
    __log_log err "ERROR" $@
}

log_warn()
{
    __log_log warning "WARNING" $@
}

log_info()
{
    __log_log info "INFO" $@
}

log_debug()
{
    if [ ! -z "$debug" -a -z "$log_no_stdout" ]
    then
	__log_set_subject 2
	echo "${__log_logging}: DEBUG - $@"   
    fi
}

# Internal

__log_log()
{
    local level=$1
    shift
    local cleartext_level=$1
    shift
    __log_set_subject 3
    case $level in
	crit) echo "${__log_logging}: $cleartext_level - $@" 1>&2
	    ;;
	err) echo "${__log_logging}: $cleartext_level - $@" 1>&2
	    ;;
	*) [ -z "$log_no_stdout" ] && echo "${__log_logging}: $cleartext_level - $@"
	    ;;
    esac
    [ -z "$log_no_logger" ] && /usr/bin/logger -i -t "SOMO:${__log_logging}" -p user.$level -- "$cleartext_level - $@"
}

__log_set_subject()
{
    __log_logging="$log_subject"
    if [ -z "$__log_logging" ]
    then
	__log_logging=`basename $0`
	__log_func="${FUNCNAME[$1]}"
	[ ! -z "$__log_func" ] && __log_logging="${__log_logging}>${__log_func}"
    fi
} 

ensure_ppa() {
    install_packages python-software-properties software-properties-common
    echo "" | sudo add-apt-repository $1
    sudo apt-get update > /dev/null
}

install_packages() {
    local package_status
    local packages_to_install=""

    for package in "$@"
    do
	package_status=$(dpkg-query -W --showformat='${Status}\n' ${package} |grep "install ok installed")
	log_info Checking for ${package}: ${package_status}
	if [ "" == "${package_status}" ]
	then
	    log_info "Package ${package} is not installed."
	    packages_to_install="${packages_to_install} ${package}"
	else
	    log_info "Package ${package} is installed."
	fi
    done
    if [ "" == "${packages_to_install}" ]
    then
	log_info "No packages to install."
    else
	sudo apt-get update > /dev/null
	log_info "Installing ${packages_to_install}."
	export DEBIAN_FRONTEND=noninteractive
	sudo apt-get --force-yes --yes install ${packages_to_install}
	error=$?
	if [ $error -ne 0 ]
	then
	    log_error "Faild to install ${packages_to_install}. ($error)"
	    return $error
	fi
	return 0
    fi

}
