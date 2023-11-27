#!/usr/bin/env bash
src="CxVercility--ParallelLeiden"
out="$HOME/Logs/$src$1.log"
ulimit -s unlimited
printf "" > "$out"

# Download ParallelLeiden
if [[ "$DOWNLOAD" != "0" ]]; then
  rm -rf $src
  git clone https://github.com/wolfram77/$src
  cd $src
  git clone --depth=1 --recursive https://github.com/networkit/networkit
fi

# Build ParallelLeiden
mkdir -p build
cd build
cmake ..
cmake --build . -- -j$(nproc)
