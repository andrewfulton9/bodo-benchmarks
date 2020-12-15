#!/usr/bin/env bash

NOTEBOOKS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../notebooks >/dev/null 2>&1 && pwd )"

cd ${NOTEBOOKS_DIR}

echo ${BODO_LICENSE_CONTENT} > bodo.lic
