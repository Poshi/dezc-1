#!/usr/bin/env bash

#docker --help
#docker build --help
docker run --help | grep "Automatically remove the container" | awk '{print $1}'
