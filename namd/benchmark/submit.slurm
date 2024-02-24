#!/bin/bash
#SBATCH --job-name="LPBM_NAMD"
#SBATCH --ntasks-per-node=40
#SBATCH --output=LPBM_NAMD_%j.out
#SBATCH --error=LPBM_NAMD_%j.err
#SBATCH --time=01:00:00
#SBATCH --account=scinet
#SBATCH --nodes=100
module load NiaEnv/2022a
module load gcc/11.3.0
module load openmpi/4.1.4+ucx-1.11.2
export NAMD_BIN=/scratch/s/scinet/willis2/rfp/benchmarks/NAMD_3.0b6_Source/Linux-x86_64-g++-memopt
$NAMD_BIN/charmrun ++p $SLURM_NTASKS $NAMD_BIN/namd3 $PWD/210stmv2fs.namd
