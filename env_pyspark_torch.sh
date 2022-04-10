#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark_torch}.tar.gz

/opt/python/bin/python3 -m pip install \
    loguru notifiers \
    pyarrow datacompy \
    torch==1.7.0+cpu torchvision==0.8.1+cpu torchaudio==0.7.0 -f https://download.pytorch.org/whl/torch_stable.html \
    transformers \
    pysparker

if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
