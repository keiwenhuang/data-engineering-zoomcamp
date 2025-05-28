-- Setup
CREATE OR REPLACE EXTERNAL TABLE `refined-cortex-460500-i2.zoomcamp.yellow_taxi_ext`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://refined-dezoomcamp_hw3_2025/yellow_tripdata_2024-*.parquet']
);

CREATE OR REPLACE TABLE `refined-cortex-460500-i2.zoomcamp.yellow_taxi_materialized`
AS
SELECT *
FROM refined-cortex-460500-i2.zoomcamp.yellow_taxi_ext


-- Q1:
SELECT count(*) FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_materialized`;

-- Q2:
SELECT COUNT(DISTINCT(PULocationID)) FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_ext`
-- This query will process 0 B when run.

SELECT COUNT(DISTINCT(PULocationID)) FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_materialized`
-- This query will process 155.12 MB when run.

-- Q3:
SELECT PULocationID
, DOLocationID 
FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_materialized`

-- This query will process 155.12 MB when run. without DOLocationID
-- This query will process 310.24 MB when run. with DOLocationID

-- Q4:
SELECT COUNT(*)
FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_ext`
WHERE fare_amount = 0

-- Q5:
CREATE OR REPLACE TABLE `refined-cortex-460500-i2.zoomcamp.yellow_taxi_partitioned_cluster`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID 
AS
SELECT * 
FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_ext`

-- Q6:
SELECT distinct(VendorID) FROM  `refined-cortex-460500-i2.zoomcamp.yellow_taxi_materialized`
WHERE DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01' AND '2024-03-15';
-- This query will process 310.24 MB when run.

SELECT distinct(VendorID) FROM `refined-cortex-460500-i2.zoomcamp.yellow_taxi_partitioned_cluster`
WHERE DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01' AND '2024-03-15';
-- This query will process 26.84 MB when run.