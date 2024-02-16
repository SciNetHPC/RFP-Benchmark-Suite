#!/bin/bash
#SBATCH --job-name="HPCG_LPBM"
#SBATCH --ntasks-per-node=40
#SBATCH --output=HPCG_LPBM_job.out
#SBATCH --error=HPCG_LPBM_job.err
#SBATCH --time=01:00:00
#SBATCH --account=scinet
#SBATCH --nodes=100
module load NiaEnv/2022a
module load intel/2022u2
module load intelmpi/2022u2+ucx-1.11.2
mpirun -np $SLURM_NTASKS /scratch/s/scinet/willis2/rfp/benchmarks/LP_HPCG/bin/xhpcg --nx=56 --ny=216 --nz=376 --rt=1800
