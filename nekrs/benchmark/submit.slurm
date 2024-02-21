#!/bin/bash
#SBATCH --job-name="LPBM_NekRS"
#SBATCH --ntasks-per-node=40
#SBATCH --output=LPBM_NekRS_job_%j.out
#SBATCH --error=LPBM_NekRS_job_%j.err
#SBATCH --time=90:00
#SBATCH --account=scinet
#SBATCH --nodes=100
module load NiaEnv/2022a
module load gcc/11.3.0
module load openmpi/4.1.4+ucx-1.11.2
module load cmake
export NEKRS_HOME=/scratch/s/scinet/willis2/rfp/RFP-Benchmark-Suite/nekrs/nekrs-install
export PATH=$PATH:$NEKRS_HOME/bin
mpirun -np $SLURM_NTASKS nekrs --setup turbChannel.par --backend CPU
