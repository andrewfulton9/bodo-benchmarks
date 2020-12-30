CREATE TABLE trips (
  VendorID               INTEGER,
  tpep_pickup_datetime   TIMESTAMP,
  tpep_dropoff_datetime  TIMESTAMP,
  passenger_count        INTEGER,
  trip_distance          DOUBLE,
  pickup_longitude       DOUBLE,
  pickup_latitude        DOUBLE,
  RateCodeID             INTEGER,
  store_and_fwd_flag     CHAR(1),
  dropoff_longitude      DOUBLE,
  dropoff_latitude       DOUBLE,
  payment_type           INTEGER,
  fare_amount            DOUBLE,
  extra                  DOUBLE,
  mta_tax                DOUBLE,
  tip_amount             DOUBLE,
  tolls_amount           DOUBLE,
  improvement_surcharge  DOUBLE,
  total_amount           DOUBLE
) WITH (FRAGMENT_SIZE=85000000);
