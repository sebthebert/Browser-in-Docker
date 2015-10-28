#!/bin/bash

dir_script=$( dirname $0 )
docker_host_ip=$( ifconfig vboxnet1 | grep inet | cut -f 2 -d' ')
user_uid=$( id -u )

#docker-machine
#bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh

#
# FUNCTION: build $browser
#
# Builds Docker image for the $browser
#
build()
{
	local browser=$1

	local name="${browser}-in-docker"
	local dir_dockerfile="${dir_script}/docker/${name}"

	echo "Building ${browser} in Docker..."
	docker build -t "${name}" "${dir_dockerfile}"
}

#
# FUNCTION: launch $browser $volume
#
# Launches Docker image "${browser}-in-docker"
#
launch()
{
	local browser=$1
	local volume=$2

	local name="${browser}-in-docker"

	echo "Lauching ${browser} in Docker..."
	arg_volume=''
	[ ! "$volume" == "" ] && arg_volume="-v ${volume}:/root"
	docker run -e DISPLAY=${docker_host_ip}:0 ${arg_volume} -t "${name}"
}

#
# FUNCTION: error $msg
#
# Prints $msg error and exit 1
#
error()
{
	local msg=$1

    echo "[ERROR] ${msg}"
    exit 1
}

#
# FUNCTION: requirements
#
# Checks requirements
#
requirements()
{
	echo "Checking requirements..."
	which docker 2>&1 > /dev/null
	[ "$?" == "1" ] && error "Docker is missing !"
	[[ ! $DISPLAY == *"xquartz:0" ]] && error "XQuartz is not running !"
	echo " => Requirements OK !"
}

#
# MAIN
#

case "$1" in
	chromium|firefox)
		requirements
    	build $1
		launch $1 $2
    ;;
esac
