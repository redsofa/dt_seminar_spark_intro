FROM redsofauid/cluster-base

# -- Layer: JupyterLab

ARG spark_version=3.2.1
ARG hadoop_version=3.2
ARG jupyterlab_version=3.3.0

RUN apt-get update -y && \
    apt-get install -y gfortran && \
    apt-get install -y libjpeg-dev && \
    apt-get install -y libblas3 && \
    apt-get install -y liblapack3 && \
    apt-get install -y liblapack-dev && \
    apt-get install -y libblas-dev && \
    apt-get install -y libffi-dev && \
    apt-get install -y python3-pip && \
    apt-get install -y zlib1g-dev && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} && \
    pip3 install scipy && \
    pip3 install numpy && \
    pip3 install pandas && \
    pip3 install matplotlib && \
    pip3 install seaborn && \
    pip3 install numpy


# -- Runtime

EXPOSE 8888
WORKDIR /src
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=