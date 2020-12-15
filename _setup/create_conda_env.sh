#!/usr/bin/env bash

SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

conda env create --name bodoai-nb --file ${SETUP_DIR}/environment-dev.yaml --force
