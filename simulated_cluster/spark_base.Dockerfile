FROM redsofauid/cluster-base

# -- Layer: Apache Spark

ARG spark_version=3.2.1
ARG hadoop_version=3.2
ENV USER ds

WORKDIR /tmp

USER $USER

RUN curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /home/$USER/apps/ && \
    mkdir -p /home/$USER/apps/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz

ENV SPARK_HOME /home/$USER/apps/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

ENV PATH "$PATH:/home/$USER/apps/spark-${spark_version}-bin-hadoop${hadoop_version}/bin"

# -- Runtime
WORKDIR ${SPARK_HOME}