#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark_torch}.tar.gz

/opt/python/bin/python3 -m pip install \
    loguru notifiers \
    datacompy \
    torch==1.5.1+cpu torchvision==0.6.1+cpu -f https://download.pytorch.org/whl/torch_stable.html \
    transformers

if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
