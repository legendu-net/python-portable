#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark_optimus}.tar.gz

/opt/python/bin/python3 -m pip install \
    findspark \
    loguru notifiers \
    optimuspyspark
    
if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
