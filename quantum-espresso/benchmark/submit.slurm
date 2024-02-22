#!/bin/bash
#SBATCH --job-name="Ausurf_QE"
#SBATCH --ntasks-per-node=40
#SBATCH --output=Ausurf_QE_job_%j.out
#SBATCH --error=Ausurf_QE_job_%j.err
#SBATCH --time=90:00
#SBATCH --account=scinet
#SBATCH --nodes=10
module load NiaEnv/2022a
module load gcc/11.3.0
module load openmpi/4.1.4+ucx-1.11.2
module load mkl

export QE_HOME=/scratch/s/scinet/ejspence/benchmarks/RFP-Benchmark-Suite/quantum-espresso
export PATH=$PATH:$QE_HOME/bin

export OMP_NUM_THREADS=1

mpirun -np $SLURM_NTASKS pw.x -inp ausurf.in > run.out
