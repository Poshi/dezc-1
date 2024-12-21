#!/usr/bin/env bash

docker build -t dezc_python:1.0 .

docker compose up -d
docker run -v .:/app --network dezc dezc_python:1.0 python /app/ingest_data.py
docker compose down