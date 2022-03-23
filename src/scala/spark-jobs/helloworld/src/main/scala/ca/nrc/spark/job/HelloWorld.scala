package ca.nrc.spark.job

import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions.{_}

object HelloWorld {

  def main(args: Array[String]) : Unit = {

    println("============================================================")
    println("HelloWorld Job.")
    println("============================================================")
  
    //1 - Start the Spark session
    val spark = SparkSession
      .builder()
      .appName("hello-world-scala")
      .getOrCreate()

    //2 - Read in the input data
    val iris_df = spark
        .read
        .option("header", true)
        .csv("/data/iris.csv")


    println("============================================================")
    println("Showing raw data.")
    println("============================================================")
    //3 - Show the data's schema and a sample
    iris_df.printSchema()
    iris_df.show()


    println("============================================================")
    println("Showing variety count.")
    println("============================================================")
    //4 - Show count of varieties
    val variety_count_df = iris_df
      .select(col("variety"))
      .groupBy("variety")
      .count

    variety_count_df.show()


    println("============================================================")
    println("Closing Spark session.")
    println("============================================================")
    //5 - Close Spark session
    spark.close()
  }
}