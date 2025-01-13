#!/usr/bin/env python3

import pandas as pd
from sqlalchemy import create_engine

# URL constants
zones_url="https://d37ci6vzurychx.cloudfront.net/misc/taxi_zone_lookup.csv"
green_taxi_csv_url = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz"
green_taxi_parquet_url = "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2019-10.parquet"

# Read zones data
zones_dtypes = {
    'LocationID': pd.UInt16Dtype(),
    'Borough': pd.StringDtype(),
    'Zone': pd.StringDtype(),
    'service_zone': pd.StringDtype(),
}
zones = pd.read_csv(zones_url, dtype=zones_dtypes)

# Green taxi data types
green_taxi_dtypes = {
    'VendorID': pd.CategoricalDtype(),
    'store_and_fwd_flag': pd.CategoricalDtype(),
    'RatecodeID': pd.CategoricalDtype(),
    'PULocationID': pd.UInt16Dtype(),
    'DOLocationID': pd.UInt16Dtype(),
    'passenger_count': pd.UInt8Dtype(),
    'trip_distance': pd.Float32Dtype(),
    'fare_amount': pd.Float32Dtype(),
    'extra': pd.Float32Dtype(),
    'mta_tax': pd.Float32Dtype(),
    'tip_amount': pd.Float32Dtype(),
    'tolls_amount': pd.Float32Dtype(),
    'ehail_fee': pd.Float32Dtype(),
    'improvement_surcharge': pd.Float32Dtype(),
    'total_amount': pd.Float32Dtype(),
    'payment_type': pd.CategoricalDtype(),
    'trip_type': pd.CategoricalDtype(),
    'congestion_surcharge': pd.Float32Dtype(),
}

# Read green taxi data
gt_source = 'parquet'
if gt_source == 'csv':
    # Read Green taxi from CSV
    green_taxi_dates = ['lpep_pickup_datetime', 'lpep_dropoff_datetime']
    green_taxi = pd.read_csv(green_taxi_csv_url, parse_dates=green_taxi_dates, dtype=green_taxi_dtypes)
else:
    # Read Green taxi from Parquet
    green_taxi = pd.read_parquet(green_taxi_parquet_url).astype(green_taxi_dtypes)

# Upload data to the DB
engine = create_engine('postgresql://root:root@db:5432/ny_taxi')
zones.to_sql(name='zones', con=engine, if_exists='replace')
green_taxi.to_sql(name='green_taxi_data', con=engine, if_exists='replace')
