#!/usr/bin/env bash

docker run -i python:3.9 bash <<EOF
pip list --format freeze 2>/dev/null | grep wheel | cut -f3 -d=
EOF
