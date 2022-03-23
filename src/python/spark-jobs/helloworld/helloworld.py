
from pyspark.sql import SparkSession
from pyspark.sql.functions import col

def main():
    
    print("============================================================")
    print("HelloWorld Job.")
    print("============================================================")

    #1 - Start the Spark session
    spark = SparkSession\
        .builder\
        .appName("hello-world-python")\
        .getOrCreate()

    #2 - Read in the input data
    iris_df = spark\
        .read\
        .option("header", True)\
        .csv("/data/iris.csv")

    print("============================================================")
    print("Showing raw data.")
    print("============================================================")

    #3 - Show the data's schema and a sample
    iris_df.printSchema()
    iris_df.show(10, False)

    print("============================================================")
    print("Showing variety count.")
    print("============================================================")
    #4 - Show count of varieties
    variety_count_df = iris_df\
        .select(col("variety"))\
        .groupBy(col("variety"))\
        .count()

    variety_count_df.show()

    print("============================================================")
    print("Closing Spark session.")
    print("============================================================")
    #5 - Close Spark session
    spark.stop()


if __name__ == '__main__':
    main()