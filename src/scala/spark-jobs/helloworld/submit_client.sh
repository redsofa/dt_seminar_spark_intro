#!/bin/bash

spark-submit \
    --class ca.nrc.spark.job.HelloWorld \
    --master spark://spark-master:7077 \
    --deploy-mode client \
    --num-executors 1 \
    --total-executor-cores 1 \
    --executor-memory 1G \
    --driver-memory 2G \
    --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:./src/main/resources/log4j.properties" \
    --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:./src/main/resources/log4j.properties" \
    ./target/sc_helloworld-1.0-SNAPSHOT.jar