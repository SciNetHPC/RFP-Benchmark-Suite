#!/bin/bash

## Instructions for building Quantum Espresso on Niagara.

## Load the required modules.
module load NiaEnv/2022a
module load gcc/11.3.0
module load openmpi/4.1.4
module load mkl

## Download the code.
wget https://gitlab.com/QEF/q-e/-/archive/qe-7.3/q-e-qe-7.3.tar.gz

## Unpack the code.
tar -zxf q-e-qe-7.3.tar.gz

## Build the code
cd q-e-qe-7.3
./configure --enable-openmp
make pw -j4
