FROM redsofauid/cluster-base

# -- Layer: JupyterLab
ENV USER ds
ARG spark_version=3.2.1
ARG hadoop_version=3.2
ARG jupyterlab_version=3.3.0

USER $USER

RUN pip install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} && \
    pip install scipy && \
    pip install numpy && \
    pip install pandas && \
    pip install matplotlib && \
    pip install seaborn

# -- Runtime
EXPOSE 8888
WORKDIR /src
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=