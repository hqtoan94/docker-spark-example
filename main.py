from pyspark import sql

sc = sql.SparkSession.builder.master("spark://spark-master:7077").appName("Testing").getOrCreate()

df = sc.read.format("com.databricks.spark.csv").option("header", "true").load("hdfs://namenode:8020/user/hqtoan94/example.csv")
df.show()