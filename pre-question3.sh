#!/usr/bin/env bash

docker build -t dezc:1.0 .

docker compose up -d
docker run --name dezc -v .:/app --network dezc dezc:1.0 python /app/ingest_data.py
docker compose down