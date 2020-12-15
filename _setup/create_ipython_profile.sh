#!/usr/bin/env bash

if [ "$(ipython profile list|grep -c mpi)" -ge 1 ]; then
    echo "[II] IPython MPI profile found "
else
    echo "[II] Creating IPython MPI profile ..."
    ipython profile create --parallel --profile=mpi
fi
