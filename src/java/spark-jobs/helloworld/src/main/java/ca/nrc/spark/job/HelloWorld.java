package ca.nrc.spark.job;

import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.Encoders;
import org.apache.spark.sql.functions.*;
import static org.apache.spark.sql.functions.callUDF;

public class HelloWorld {

    public static void main(String[] args) {
        HelloWorld job = new HelloWorld();
        job.startJob();
    }

    private void startJob( ){
        System.out.println("============================================================");
        System.out.println("HelloWorld Job.");
        System.out.println("============================================================");

        //1 - Start the Spark session
        SparkSession spark = SparkSession
                .builder()
                .appName("hello-world-java")
                .getOrCreate();

        //2 - Read in the input data
        Dataset<Row> iris_df = spark
                .read()
                .option("header", "true")
                .csv("/data/iris.csv");


        System.out.println("============================================================");
        System.out.println("Showing raw data.");
        System.out.println("============================================================");

        //3 - Show the data's schema and a sample
        iris_df.printSchema();
        iris_df.show();



        System.out.println("============================================================");
        System.out.println("Showing variety count.");
        System.out.println("============================================================");

        //4 - Show count of varieties
        Dataset<Row> variety_count_df = iris_df
                .select("variety")
                .groupBy("variety")
                .count();

        variety_count_df.show();


        System.out.println("============================================================");
        System.out.println("Closing Spark session.");
        System.out.println("============================================================");
        //5 - Close Spark session
        spark.close();
    }
}