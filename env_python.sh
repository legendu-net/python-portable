#!/usr/bin/env bash

file=/workdir/${1:-env_python}.tar.gz

/opt/python/bin/python3 -m pip install \
    IPython "jupyterlab<2.3.0" nbconvert nbformat \
    pandas pandas_profiling pyarrow findspark \
    JPype1 sqlparse \
    tqdm GitPython toml PyYAML python-magic \
    loguru notifiers \
    dateparser \
    requests \
    pylint yapf \
    opencv-python pillow PyPDF2 \
    git+https://github.com/dclong/xinstall@main

/opt/python/bin/python3 -m pip install --no-deps git+https://github.com/dclong/dsutil@main
    
if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
