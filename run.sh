#!/usr/bin/env bash

function run.usage(){
    cat << EOF
Run a script to build a portable Python environment in a container of the Docker image dclong/python-potable.

Syntax: ./run.sh [-h] env_example.sh
    -h: Print this help doc.
    env_example.sh: A shell script which installs Python packages and create a tar.gz archive from the portable Python environment. 

EOF
}

if [ "$#" -ne 1 ]; then
    echo "The script run.sh requires exactly 1 parameter! Please refe to the help doc below."
    echo
    run.usage
    exit 1
fi

if [ "$1" == "-h" ]; then
    run.usage
    exit 0
fi

chmod +x "$1"
docker run \
    --hostname python-portable \
    --log-opt max-size=50m \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v "$(pwd)":/workdir \
    -v "$(dirname $HOME)":/home_host \
    dclong/python-portable /workdir/$1
