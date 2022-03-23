#!/bin/bash

spark-submit \
    --class ca.nrc.spark.job.HelloWorld \
    --master spark://spark-master:7077 \
    --deploy-mode cluster \
    --num-executors 3 \
    --total-executor-cores 5 \
    --executor-memory 3G \
    --driver-memory 3G \
    /src/java/spark-jobs/helloworld/target/jv_helloworld-1.0-SNAPSHOT.jar