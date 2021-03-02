
# [Portable Python Environments](https://github.com/dclong/python-portable)

Prebuilt portable Python environmens for common tasks.

## Prerequisite
The shell scripts `run.sh` must be run in an environment where Docker is installed
as it leverages the Docker image 
[dclong/python-portable](https://github.com/dclong/docker-python-portable) 
to build portable Python environments.

## Pre-developed Scripts for Building and Packing Portable Python

| Script               | Build Command                 | Output                   | Comments                                                           |
|----------------------|-------------------------------|--------------------------|--------------------------------------------------------------------|
| env_python.sh        | ./run.sh env_python.sh        | env_python.tar.gz        | A portable Python env.                                             |
| env_pyspark.sh       | ./run.sh env_pyspark.sh       | env_pyspark.tar.gz       | A portable Python env for running with PySpark.                    |
| env_pyspark_torch.sh | ./run.sh env_pyspark_torch.sh | env_pyspark_torch.tar.gz | A portable Python env for running PyTorch models using PySpark.    |
| env_pyspark_tf.sh    | ./run.sh env_pyspark_tf.sh    | env_pyspark_tf.tar.gz    | A portable Python env for running TensorFlow models using PySpark. |

## Build Customized Portable Python Environment

1. Please following examples in the `env_*.sh` scripts in the above table 
    to develop you own cutomized scripts.

2. Run your script using `./run.sh your_script.sh`.
