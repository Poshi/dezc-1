#!/usr/bin/env bash

# If no arguments provided, start Jupyter Lab
if [ "${#}" -eq 0 ]
then
    jupyter lab --no-browser --allow-root --ip=0.0.0.0
fi

# If arguments provided, run them
exec "${@}"
