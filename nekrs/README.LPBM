Instructions for performing the NekRS benchmark, as part of the
SciNet LP RFP.

1) Download source code from: https://github.com/Nek5000/nekRS/archive/refs/tags/v23.0.tar.gz
   (md5sum: 475131966c187ccfda72f1a8a20ef36f)

2) Extract source code "tar -xaf v23.0.tar.gz"

3) Modify the environment appropriately to use the correct compiler and
   optimization flags for the system in question. Make sure the mpirun command is available.
   In the reference benchmark openmpi/4.1.4 was compiled with gcc/11.3.0 and cmake/3.22.5.
   Build NekRS:

    cd nekRS-23.0
    mkdir -p build
    cd build
    cmake -Wfatal-errors -DCMAKE_INSTALL_PREFIX=/path/to/nekrs-install ..
    make -j 8
    make install 

4) In the benchmark directory of LP_NekRS run:

    export NEKRS_HOME=/path/to/nekrs-install
    export PATH=$PATH:$NEKRS_HOME/bin
    
    mpirun -np NUM_PROCS nekrs --setup turbChannel.par --backend BACKEND
    
   where NUM_PROCS corresponds to the number of MPI
   processes being launched and BACKEND can be [CPU|CUDA|HIP|DPCPP|OPENCL] 
   depending on which architecture is being used. "--map-by ppr:NUM_GPUS_PER_NODE:node" will 
   need to be added as an mpirun argument when running on multiple GPU nodes. An example SLURM
   script is provided, "submit.slurm" that was used to produce the reference benchmark on Niagara.
   CMake is also needed at runtime for the JIT compilation phase.

5) Note the benchmark problem size fits on a minimum of 8 nodes of Niagara at ~130GB memory usage per node.

6) Note that the code will automatically calculate the running time of
   the code, and output these numbers. The "totalElapsed=" in seconds 
   should be reported in the "NekRS" tab of the LPBM Schedule 1 spreadsheet.

7) Note that the code may fail at runtime during the JIT kernel compilation phase if switching
   between architectures. Try removing the .cache directory generated in the benchmark directory.

8) All modified source code, output logs, and solution files are to be provided in with the
   response.
