Reference
----------
* https://www.kdnuggets.com/2020/07/apache-spark-cluster-docker.html


Purpose
-------
* This set of Docker configuration files is for demonstration purposes only. Not for production use.


Building images
---------------
* make sure you are in the `./simulated_cluster` directory
* docker-compose --profile base build
* docker-compose --profile dev build
* docker-compose --profile cluster build


Running cluster
---------------
* docker-compose  --profile cluster up -d


Running development node
-----------------------
* docker-compose run spark-dev


URLs - (Assumes spark-master resolves properly)
----
* JupyterLab at : http://spark-master:8888/
* Spark master at : http://spark-master:8080/
* Spark worker I at : http://spark-master:8081
* Spark worker II at : http://spark-master:8082
* Spark worker III at : http://spark-master:8083
