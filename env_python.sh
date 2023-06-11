#!/usr/bin/env bash

file=/workdir/${1:-env_python}.tar.gz

/opt/python/bin/python3 -m pip install \
    pylint black pytype \
    IPython "jupyterlab<4.0" nbconvert nbformat \
    pandas ydata-profiling pyarrow findspark \
    aiutil

if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
