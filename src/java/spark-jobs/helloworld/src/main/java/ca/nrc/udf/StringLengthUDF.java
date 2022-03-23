package ca.nrc.udf;

import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.api.java.UDF1;

public class StringLengthUDF implements UDF1<String, Long> {

    @Override
    public Long call(String str) throws Exception {
        if(str != null && !str.trim().isEmpty()){
            return new Long(str.length());
        }else{
            return 0L;
        }
    }
}
