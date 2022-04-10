#!/usr/bin/env bash

file=/workdir/${1:-env_pyspark_torch}.tar.gz

/opt/python/bin/python3 -m pip install \
    loguru notifiers \
    pyarrow datacompy \
    torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu \
    transformers \
    pysparker

if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
