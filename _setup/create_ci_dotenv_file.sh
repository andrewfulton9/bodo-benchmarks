#!/usr/bin/env bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ >/dev/null 2>&1 && pwd )"

cd ${PROJECT_DIR}

echo "" > .env
echo "BODO_LICENSE_CONTENT=${BODO_LICENSE_CONTENT}" >> .env
echo "BODO_CONDA_USERNAME=${BODO_CONDA_USERNAME}" >> .env
echo "BODO_CONDA_TOKEN=${BODO_CONDA_TOKEN}" >> .env
echo "PYTHONUNBUFFERED=1" >> .env
