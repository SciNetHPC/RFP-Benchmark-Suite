#!/bin/bash
ml NiaEnv/2022a gcc openmpi cmake
tar xaf v23.0.tar.gz
cd nekRS-23.0
mkdir -p build
cd build
cmake -Wfatal-errors -DCMAKE_INSTALL_PREFIX=$PWD/../../nekrs-install ..
make -j 8
make install
