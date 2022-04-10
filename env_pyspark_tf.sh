#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark_tf}.tar.gz

/opt/python/bin/python3 -m pip install \
    loguru notifiers \
    pandas pyarrow \
    tensorflow "pillow==7.1.2" \
    pysparker

if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
