#!/bin/bash
#SBATCH --job-name="Ta2O5_QE"
#SBATCH --ntasks-per-node=40
#SBATCH --output=Ta2O5_QE_job_%j.out
#SBATCH --error=Ta2O5_QE_job_%j.err
#SBATCH --time=4:00:00
#SBATCH --account=scinet
#SBATCH --nodes=100

module load NiaEnv/2019b
module load gcc/8.3.0
module load openmpi/4.1.4+ucx-1.11.2-mt
module load mkl/2019u4

export QE_HOME=$SCRATCH/benchmarks/qe/q-e-qe-7.3
export PATH=$PATH:$QE_HOME/bin

export OMP_NUM_THREADS=1

srun pw.x -inp Ta2O5-2x2xz-552.in > run.out
