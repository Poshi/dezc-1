#!/usr/bin/env bash

docker run --name dezc --network dezc -v .:/app dezc:1.0 psql --tuples-only --no-align --quiet postgresql://root:root@db:5432/ny_taxi --file /app/question3-4-5-6.sql