#!/usr/bin/env bash

file=/workdir/${1:-env_python}.tar.gz

/opt/python/bin/python3 -m pip install \
    IPython "jupyterlab<2.3.0" \
    loguru notifiers \
    pandas pyarrow \
    git+https://github.com/dclong/xinstall@master
    dateparser
    pandas = ">=0.22.0"
    loguru = ">=0.3.2"
    toml = ">=0.10.0"
    pylint = ">=2.4.0"
    yapf = ">=0.28.0"
    PyPDF2 = ">=1.26.0"
    requests = ">=2.20.0"
    tqdm = ">=4.40.0"
    opencv-python = ">=4.0.0.0"
    pillow = ">=7.0.0"
    GitPython = ">=3.0.0"
    nbformat = ">=5.0.7"
    notifiers = ">=1.2.1"
    nbconvert = ">=6.0.7"

/opt/python/bin/python3 -m pip install --no-deps git+https://github.com/dclong/dsutil@master
    
if [[ $? -eq 0 ]]; then
    cd /opt/python/
    tar -zcvf $file ./
    chown $DOCKER_USER_ID:$DOCKER_GROUP_ID $file
fi
