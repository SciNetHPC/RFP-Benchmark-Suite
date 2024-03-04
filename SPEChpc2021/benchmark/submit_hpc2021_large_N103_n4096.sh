#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=4096
#SBATCH --partition=compute
#SBATCH --account=scinet
#SBATCH --time=24:00:00

ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2

INSTALL_DIR=/scratch/path/to/SPEC/gcc_11.3.0_openmpi_4.1.4_ucx-1.11.2/hpc2021

cd $INSTALL_DIR
source shrc
cd $SPEC/config

runhpc --config=gnu.cfg --ranks $SLURM_NTASKS --reportable --tune=base --pmodel MPI large

