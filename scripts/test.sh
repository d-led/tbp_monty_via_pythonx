#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1

mix test
