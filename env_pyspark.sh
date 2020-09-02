#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark}.tar.gz

/opt/python/bin/python3 -m pip install \
    loguru notifiers \
    pyarrow datacompy
    
if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
