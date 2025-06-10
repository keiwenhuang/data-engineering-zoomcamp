CREATE OR REPLACE EXTERNAL TABLE `refined-cortex-460500-i2.hw4.fhv_tripdata_ext`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://refined-cortex-460500-i2-kestra/fhv/fhv_tripdata_2019-*.parquet']
);

CREATE OR REPLACE EXTERNAL TABLE `refined-cortex-460500-i2.hw4.green_tripdata_ext`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://refined-cortex-460500-i2-kestra/green/green_tripdata_*.parquet']
);

CREATE OR REPLACE EXTERNAL TABLE `refined-cortex-460500-i2.hw4.yellow_tripdata_ext`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://refined-cortex-460500-i2-kestra/yellow/yellow_tripdata_*.parquet']
);


