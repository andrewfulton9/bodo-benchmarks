#!/usr/bin/env bash

if [ "$(ps ax|grep ipython|grep controller|grep -c mpi)" -ge 1 ]; then
    echo "[II] Stopping IPython MPI controllers ..."
    ipcluster stop --profile=mpi
    echo "[II] Waiting ..."
    sleep 20
    echo "[II] Done."
else
    echo "[II] No IPython MPI controllers found."
fi
