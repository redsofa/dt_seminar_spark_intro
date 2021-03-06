# Introduction to Apache Spark 
### Tech Talk Companion Repository

The tech talk introduces Apache Spark, a unified analytics engine designed for large-scale data processing. 
The talk also demonstrates how Spark makes an excellent addition to any data analysis toolkit. 
Through demos we will cover:

* Launching a simulated Spark cluster.
* Submitting simple jobs with tailored resource requirements.
* Performing common data transformations.
* Training a simple Spark MLlib algorithm for used-vehicle price prediction.


# Tech Talk Slides

* See the [./docs/slides/2022_dt_seminar_spark_intro.pdf](./docs/slides/2022_dt_seminar_spark_intro.pdf) file.


# Starting the Simulated Cluster

* See the [./simulated_cluster/README.md](simulated_cluster/README.md) file.


# Spark-submit 

* Scala (HelloWorld) job spark-submit shell script : [./src/scala/spark-jobs/helloworld/submit_client.sh](./src/scala/spark-jobs/helloworld/submit_client.sh).
* Java (HelloWorld) job spark-submit shell script : [./src/java/spark-jobs/helloworld/submit_cluster.sh](./src/java/spark-jobs/helloworld/submit_cluster.sh).
* Python (HelloWorld) job spark-submit shell script : [./src/python/spark-jobs/helloworld/submit_client.sh](./src/python/spark-jobs/helloworld/submit_client.sh).


# Jupyter Notebooks 

* Car data ETL notebook : [./src/jupyter/1_car_data_ETL.ipynb](./src/jupyter/1_car_data_ETL.ipynb) file.
* Car data Predictions notebook : [./src/jupyter/2_car_data_predictions_MLlib.ipynb](./src/jupyter/2_car_data_predictions_MLlib.ipynb) file.


# Additional Jupyter Notebooks 

* Python HelloWorld notebook : [./src/jupyter/helloworld.ipynb](./src/jupyter/helloworld.ipynb) file.
* Common ETL Operations : [./src/jupyter/common_ops.ipynb](./src/jupyter/common_ops.ipynb) file.