# NekRS Benchmark

1. Download source code from https://github.com/Nek5000/nekRS/archive/refs/tags/v23.0.tar.gz
   (md5sum: 475131966c187ccfda72f1a8a20ef36f).

2. Extract source code: `tar -xaf nekRS-23.0.tar.gz`

3. Modify the environment appropriately to use the correct compiler and
   optimization flags for the system in question. Make sure the mpirun command is available.
   In the reference benchmark openmpi/4.1.4 was compiled with gcc/11.3.0 and cmake/3.22.5.
   There is a list of commands that were run to build NekRS on Niagara in the
   [`build_nekrs.sh`](niagara/build_nekrs.sh) file.

4. In the benchmark directory run:

       export NEKRS_HOME=/path/to/nekrs-install
       export PATH="$NEKRS_HOME/bin:$PATH"
    
       mpirun -np NUM_PROCS nekrs --setup turbChannel.par --backend CPU
    
   where `NUM_PROCS` corresponds to the number of MPI
   processes being launched. It should be run on at least 50 nodes. An example SLURM
   script is provided, [`submit.slurm`](niagara/submit.slurm) that was used to produce the reference benchmark on Niagara.
   CMake is also needed at runtime for the JIT compilation phase.

5. Note the reference benchmark run on 100 nodes of Niagara used ~40GB of memory per node.

6. Note that the code will automatically calculate the running time of
   the code, and output these numbers. The "totalElapsed=" in seconds 
   should be reported in the "NekRS" tab of the LP2BM Schedule G spreadsheet.

7. The input files were generated from the `turbChannel` example found in the NekRS repository
   [here](https://github.com/Nek5000/nekRS/tree/master/examples/turbChannel). The mesh size
   was increased in `turbChannel.box` and [`genbox`](https://github.com/Nek5000/Nek5000/tree/master/tools/genbox)
   was used to generate a new mesh file, `turbChannel.re2`

8. Note that the code may fail at runtime during the JIT kernel compilation phase if switching
   between architectures. Try removing the .cache directory generated in the benchmark directory.

9. All modified source code, output logs, and solution files are to be provided in with the
   response.

