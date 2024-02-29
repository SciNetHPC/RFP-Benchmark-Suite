#!/bin/bash

ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2

INSTALL_DIR=/scratch/s/scinet/bmundim/SPEC/gcc_11.3.0_openmpi_4.1.4+ucx-1.11.2/hpc2021

cd $INSTALL_DIR
source ./shrc
cd $SPEC/config
runhpc --config=gnu.cfg --action=build --tune=base --ranks 40 large

