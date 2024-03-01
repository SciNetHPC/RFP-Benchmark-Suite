#!/bin/bash

## Instructions for building Quantum Espresso on Niagara.

## Load the required modules.
module load NiaEnv/2019b
module load gcc/8.3.0
module load openmpi/4.1.4+ucx-1.11.2-mt
module load mkl/2019u4

## Download the code.
wget https://gitlab.com/QEF/q-e/-/archive/qe-7.3/q-e-qe-7.3.tar.gz

## Unpack the code.
tar -zxf q-e-qe-7.3.tar.gz

## Build the code
cd q-e-qe-7.3
./configure --enable-openmp
make pw -j4
