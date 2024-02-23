#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=02:00:00
#SBATCH --gpus-per-node=4
#SBATCH -p compute_full_node

module load cmake/3.27.8 # min 3.18.4 required
module load gcc/12.3.0
module load cuda/12.3.1

nvidia-smi

export gmx="$HOME/gromacs/bin/gmx"

$gmx mdrun -ntmpi 8 -ntomp 16 -nb gpu -pme gpu -npme 1 -update gpu -bonded gpu -nsteps 100000 -resetstep 90000 -noconfout -dlb no -nstlist 300 -pin on -v -gpu_id 0123

grep Performance md.log

rm ener.edr
