# GROMACS GPU Benchmark

These are the instructions for performing the GROMACS part of the
benchmarks for the SciNet LP2BM required for the LP RFP.  This part of
the benchmark suite performs a molecular dynamics simulation of the
"Satellite Tobacco Mosaic Virus" of 1 million atoms, using GROMACS on
a single GPU node, utilizing all GPUs on that node.

The reference benchmark for the LP2BM was run on one Intel Icelake
64-core node with 4 NVIDIA A100 GPUs.

## How to Run the Benchmark

 1. Get the 2024 version of GROMACS from
    https://ftp.gromacs.org/pub/gromacs/$source_archive/gromacs-2024.tar.gz

 2. Make sure CUDA and a recent GNU g++ compiler are available.
 
    In the reference benchmark, cuda/12.3.1 and gcc/12.3.0 were used.
 
 3. The code can be compiled from the source directory using cmake as follows:

        mkdir build
        cd build
        cmake .. \
          -DCMAKE_INSTALL_PREFIX="$SOMEDIR" \
          -DGMX_BUILD_OWN_FFTW=ON \
          -DGMX_OPENMP=ON \
          -DGMX_GPU=CUDA
        make install

    where `$SOMEDIR` is a chosen installation directory.
    
    There is a list of commands that were run to build NAMD for the
    reference benchmark in the [`build_gromacs.sh`](build_gromacs.sh) file.
 
 4. The benchmark input files can be downloaded from
    https://zenodo.org/doi/10.5281/zenodo.3893788; the direct link is:

    https://zenodo.org/records/3893789/files/GROMACS_heterogeneous_parallelization_benchmark_info_and_systems_JCP.tar.gz?download=1

    This tarball contains the open data for several cases.  For the
    LP2BM, you only need the data under the path
    `GROMACS_heterogeneous_parallelization_benchmark_info_and_systems_JCP/stmv`.
    
 5. To run the benchmark, execute the following command from the
    directory containing the smtv files:

        $SOMEDIR/bin/gmx mdrun \
          -ntmpi $NTMPI -ntomp $NOMP -gpu_id $GPUIDS \
          -nb gpu -pme gpu -npme 1 -update gpu \
          -bonded gpu -nsteps 100000 -resetstep 90000 \
          -noconfout -dlb no -nstlist 300 -pin on -v 

    Here, `$SOMEDIR` should be the directory in which gromacs was
    installed (see point 3 above), `$NTMPI` should be the number of
    parallel thread-MPI processes to use, `$NOMP` should be to number
    number of OpenMP threads per thread-MPI rankm and `$GPUIDS` should be
    a string that specifies the ID numbers of the GPUs that are
    available to be used by ranks; e.g., to use all four GPUs on a 4
    gpu nodes, `$GPUIDS` might be `0123`.

    The above command assumes the use of gromacs's thread-MPI
    implementation.  Alternatively, one can use a true MPI
    implementation, as long as all GPUs are used.
    
    Note: a SLURM script has been included in the benchmark directory
    called [`run_benchmark_job.sh`](run_benchmark_job.sh) that was used to run the reference
    benchmark.
    
 6. The code will automatically report the value of the number of
    nanoseconds simulated per walltime day (ns/day), in a line that
    starts with "Performance:".

 7. All modified source code, Makefiles, output and solution files are
    to be provided in with the response.

