#!/bin/bash

# Load compiler and MPI modules with environment on Niagara:
ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2

# Set installation directory:
INSTALL_DIR=/scratch/path/to/SPEC/gcc_11.3.0_openmpi_4.1.4+ucx-1.11.2/hpc2021

# Source SPEC environment at the installation directory:
cd $INSTALL_DIR
source ./shrc

# Build the large benchmark suites using Niagara configuration gnu.cfg:
cd $SPEC/config
runhpc --config=gnu.cfg --action=build --tune=base --ranks 40 large

