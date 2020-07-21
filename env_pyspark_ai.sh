#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark_ai}.tar.gz
/opt/python/bin/python3 -m pip install \
    findspark \
    loguru notifiers \
    torch==1.5.1+cpu torchvision==0.6.1+cpu -f https://download.pytorch.org/whl/torch_stable.html \
    transformers
    
cd /opt/python/
tar -zcvf $file ./
chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
