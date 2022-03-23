FROM redsofauid/spark-base

# -- Runtime

ARG spark_worker_web_ui=8081

RUN apt-get install -y python3-pip && \
    pip3 install numpy

EXPOSE ${spark_worker_web_ui}
CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out