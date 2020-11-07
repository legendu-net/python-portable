#!/usr/bin/env bash

file=/workdir/${1:-env_python}.tar.gz

/opt/python/bin/python3 -m pip install \
    IPython "jupyterlab<2.3.0" \
    loguru notifiers \
    pandas pyarrow \
    git+https://github.com/dclong/xinstall@master \
    git+https://github.com/dclong/dsutil@master
    
if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
