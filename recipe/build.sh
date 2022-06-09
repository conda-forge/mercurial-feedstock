#!/bin/bash

export RUSTFLAGS="-C link-arg=-Wl,-rpath-link,$CONDA_PREFIX/lib -C link-arg=-Wl,-rpath,$CONDA_PREFIX/lib -L$CONDA_PREFIX/lib"

{ # try
$PYTHON -m pip install --no-deps --ignore-installed -vv --no-use-pep517 --global-option --rust .
} || { # catch
echo "ls rust/target/release/*" && \
  ls rust/target/release/* && \
  echo "ls rust/target/release" && \
  ls rust/target/release
}
