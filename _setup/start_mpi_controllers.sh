#!/usr/bin/env bash

# For now, it will use 4 processors
if [ "$(ps ax|grep ipython|grep controller|grep -c mpi)" -ge 4 ]; then
    echo "[II] IPython MPI controller found. "
else
    echo "[II] Starting IPython MPI controller ..."
    ipcluster start -n 4 --profile=mpi &
    echo "[II] Waiting ..."
    sleep 40
    echo "[II] IPython MPI controller ready."
fi
