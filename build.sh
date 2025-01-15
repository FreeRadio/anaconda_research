#!/bin/bash

brew install cmake openssl

cd $SRC_DIR

mkdir build && cd build

#conda deactivate
export CXXFLAGS="-Wno-unguarded-availability-new"

cmake .. -DCMAKE_LINKER=/usr/bin/ld -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++

make -j$(sysctl -n machdep.cpu.core_count)

make install

#conda activate
