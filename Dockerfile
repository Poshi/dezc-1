FROM python:3.9

RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip setuptools wheel
RUN pip install psycopg2 pgcli pyarrow pandas sqlalchemy jupyter

EXPOSE 8888

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
