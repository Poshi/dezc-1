#!/usr/bin/env bash

docker run python:3.12.8 pip --version | awk '{print $2}'

# Output: 24.3.1