#!/bin/bash

export RUSTFLAGS="-C link-arg=-Wl,-rpath-link,$CONDA_PREFIX/lib -C link-arg=-Wl,-rpath,$CONDA_PREFIX/lib -L$CONDA_PREFIX/lib"

$PYTHON -m pip install --no-deps --ignore-installed -vv --global-option "--rust" .
