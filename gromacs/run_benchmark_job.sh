#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --gpus-per-node=4
#SBATCH -p compute_full_node

module load cmake/3.27.8 # min 3.18.4 required
module load gcc/12.3.0
module load cuda/12.3.1
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

export $gmx="$HOME/software/gromacs/gromacs-2024/build/bin/gmx"

# Make sure we don't spend time writing useless output
options="-nsteps 20000 -resetstep 19000 -ntomp $SLURM_CPUS_PER_TASK -pin on -pinstride 1"

# Run mdrun assigning the non-bonded, PME, and update work to the GPU
srun $gmx mdrun $options -g manual-nb-pme-update.log        -nb gpu -pme gpu             -update gpu
# Run mdrun assigning the non-bonded, PME, bonded, and update
# work to the GPU
srun $gmx mdrun $options -g manual-nb-pme-bonded-update.log -nb gpu -pme gpu -bonded gpu -update gpu

# Let us know we're done
echo Done

# Clean up files we don't care about
rm -f *cpt *edr *trr *tng *gro \#*
