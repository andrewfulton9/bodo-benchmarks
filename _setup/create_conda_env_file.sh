#!/usr/bin/env bash

SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd ${SETUP_DIR}
source ../.env
popd

cp ${SETUP_DIR}/environment-template.yaml ${SETUP_DIR}/environment-dev.yaml

sed -i "s/-\ python$/-\ python ${PYTHON_VERSION:-3.8.*}/" ${SETUP_DIR}/environment-dev.yaml
sed -i "s/{{\s*BODO_CONDA_USERNAME\s*}}/${BODO_CONDA_USERNAME:-test-user}/" ${SETUP_DIR}/environment-dev.yaml
sed -i "s/{{\s*BODO_CONDA_TOKEN\s*}}/${BODO_CONDA_TOKEN:-test-token}/" ${SETUP_DIR}/environment-dev.yaml
