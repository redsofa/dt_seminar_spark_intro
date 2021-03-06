package ca.nrc.udf;

import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.api.java.UDF1;

// Note that the "UDF1<T1,R>"" super interface is "java.io.Serializable"
public class StringLengthUDF implements UDF1<String, Integer> {
    @Override
    public Integer call(String str) throws Exception {
        if(str != null && !str.trim().isEmpty()){
            return str.length();
        }else{
            return 0;
        }
    }
}
