#!/usr/bin/env bash

name=${1:-env_pyspark_ai}.tar.gz
/opt/python/bin/python3 -m pip install \
    findspark \
    loguru notifiers \
    torch==1.5.1+cpu torchvision==0.6.1+cpu -f https://download.pytorch.org/whl/torch_stable.html \
    transformers
    
cd /opt/python/
tar -zxvf $name ./
chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $name
mv $name /workdir/
