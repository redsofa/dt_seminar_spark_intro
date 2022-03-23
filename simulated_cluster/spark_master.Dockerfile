FROM redsofauid/spark-base

# -- Runtime

ARG spark_master_web_ui=8080

ENV SPARK_MASTER_OPTS "-Dspark.master.rest.enabled=true"

EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out