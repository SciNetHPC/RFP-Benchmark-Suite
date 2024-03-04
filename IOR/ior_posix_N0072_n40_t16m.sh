#!/bin/bash -l
#SBATCH -N 72
#SBATCH --ntasks-per-node=40
#SBATCH -p compute
#SBATCH -A scinet
#SBATCH -t 01:00:00

ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2

#ulimit -n 4096 # 20000 right now on login nodes, 32768 on compute nodes
FS=bbuffer
CASE="posix" # e.g. posix.odirect-F
API="posix"
API_OPTIONS="" # e.g. --posix.odirect
DATA_TYPE="-l=random" # e.g "-l=incompressible" "-l=random"
MEMORY_PER_NODE="-M=70%" # e.g. "-M=70%"
FILE_PER_TASK="" # -F
TASK_PER_NODE_OFFSET="-Q=$SLURM_NTASKS_PER_NODE" # e.g. "-Q=$SLURM_NTASKS_PER_NODE"
BLOCK_SIZE=8g
TRANSFER_SIZE=16m
ITERATIONS=2
DATE=$(date +"%Y-%m-%d")
TIME=$(date "+%H-%M-%S")
NODES=$SLURM_JOB_NUM_NODES
TASKS_PER_NODE=$SLURM_NTASKS_PER_NODE
IOR_DIR=/bb/path/to/ior/gcc_11.3.0_openmpi_4.1.4+ucx-1.11.2/bin
RUN_DIR=/bb/path/to/ior/runs/gcc_11.3.0_openmpi_4.1.4+ucx-1.11.2/ior2
DATA_DIR="$RUN_DIR"/datafiles
if [ -d "$DATA_DIR" ]; then
  rm -f "$DATA_DIR"/*
else
  mkdir "$DATA_DIR"
fi
{
echo "-------------------STARTING SIMULATION--------------------"
date
echo
echo mpirun $IOR_DIR/ior -vv -o "$DATA_DIR"/ior_test $DATA_TYPE $MEMORY_PER_NODE $FILE_PER_TASK -a=$API $API_OPTIONS -b=$BLOCK_SIZE -t=$TRANSFER_SIZE -i=$ITERATIONS -g -d=10 -e -C $TASK_PER_NODE_OFFSET
echo
mpirun $IOR_DIR/ior -vv -o "$DATA_DIR"/ior_test $DATA_TYPE $MEMORY_PER_NODE $FILE_PER_TASK -a=$API $API_OPTIONS -b=$BLOCK_SIZE -t=$TRANSFER_SIZE -i=$ITERATIONS -g -d=10 -e -C $TASK_PER_NODE_OFFSET
echo "-------------------ENDING SIMULATION--------------------"
date 
} &>> run_"${FS}"_FS_"${CASE}"_case_"${NODES}"_nodes_"${TASKS_PER_NODE}"_ppn_"${BLOCK_SIZE}"_block_"${TRANSFER_SIZE}"_transfer_"${DATE}"_date_"${TIME}"_time.out

