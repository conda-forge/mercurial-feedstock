#!/bin/bash

if [[ $build_platform == "linux-64" ]];
then
  export RUSTFLAGS="-C link-arg=-Wl,-rpath-link,$CONDA_PREFIX/lib -C link-arg=-Wl,-rpath,$CONDA_PREFIX/lib -L$CONDA_PREFIX/lib"
  sed -i'' "s/os.path.join('rust', 'target', 'release')/os.path.join('rust', 'target', os.environ.get('CARGO_BUILD_TARGET', ''), 'release')/" setup.py

  { # try
  $PYTHON -m pip install --no-deps --ignore-installed -vv --config-settings --global-option=--rust .
  } || { # catch
  echo "ls rust/target/$CARGO_BUILD_TARGET/release" && \
    ls rust/target/$CARGO_BUILD_TARGET/release && \
    find . -name "librusthg.so"
  }
else
  $PYTHON -m pip install --no-deps --ignore-installed -vv .
fi
