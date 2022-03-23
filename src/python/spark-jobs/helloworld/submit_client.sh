#!/bin/bash

spark-submit \
    --master spark://spark-master:7077 \
    --deploy-mode client \
    --executor-memory 1G \
    --total-executor-cores 2 \
    --driver-memory 2G \
    --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:./log4j.properties" \
    --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:./log4j.properties" \
    helloworld.py