#!/usr/bin/env bash

conda activate omniscidb

export OMNISCI_USER=omnisci
export OMNISCI_GROUP=omnisci
export OMNISCI_STORAGE=/work/bodoai/omniscidata
export OMNISCI_PATH=${CONDA_PREFIX}/opt/omnisci-cpu
export OMNISCI_LOG=${CONDA_PREFIX}/var/lib/omnisci/data/mapd_log

mkdir -p ${OMNISCI_STORAGE}

# prepare

cp ${OMNISCI_PATH}/bin/omnisci_initdb ${OMNISCI_PATH}/bin/initdb

# start server
cd ${OMNISCI_PATH}
./startomnisci --data ${OMNISCI_STORAGE}
