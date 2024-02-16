NAMD STMV Benchmark (part of LPBM)
==================================

These are the instructions for performing the NAMD part of the
benchmarks for the SciNet LPBM required for the LP RFP.  This part of
the benchmark suite performs a molecular dynamics simulation of the
"Satellite Tobacco Mosaic Virus, which is a virus composed of roughly
1 million atoms.

How to Run the Benchmark
------------------------

 1. Get version 3.0b6 of the NAMD application.

      * Main source and pre-built binaries can be found at:

          http://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD
          (md5sum: 98764e65e1b3957e67fe09f3b94e8782) 

        One needs to register to get the code or binaries.

 2. Make sure an mpirun or mpiexec command is available.  

    (In the reference benchmark, openmpi/4.1.4, compiled with
    gcc/11.3.0 was used to provide an mpirun command.)
 
 3. The code can be compiled following the instructions here:

    https://www.ks.uiuc.edu/Development/Download/download.cgi

    there is a list of commands that were run to build NAMD on Niagara 
    in the "build_namd.sh" file.
 
 4. The benchmark input files can be downloaded from

      http://www.ks.uiuc.edu/Research/namd/utilities/stmv.tar.gz.  

    This file can also be found in this benchmark directory, under
    "benchmark/stmv.tar.gz". 

    When untarred, this produces a directory stmv from which the run
    should be performed, containing the following files:

      par_all27_prot_na.inp
      stmv.pdb
      stmv.psf
      stmv.namd 

 5. IMPORTANT: increase the "numsteps" parameter (the last parameter
    in the configuration file "stmv/stmv.namd") from 500 to get
    adequate sampling of runtimes. For example the reference benchmark 
    on Niagara was ran for 500000 steps.

 6. To run the benchmark, execute

    $NAMD_BIN/charmrun ++p $NCORES $NAMD_BIN/namd3 $PWD/stmv.namd 

    Here, $NAMD_BIN should be the directory containing the namd binary
    and related utilities, and $NCORES should be the number of
    parallel processes to use. $NCORES should be set such that the
    number of processes is equal to the number of nodes used times the
    number of cores per node, subject to the constraints that: the 
    number of nodes is at least 100.

    The above command line assumes that mpi has been setup such that
    mpirun will launch on a set number of nodes, with as many
    processes per node as it has cores.  Alternatively, one can pass a
    ++nodelist command. Details of this way of starting a namd run are
    described in http://www.ks.uiuc.edu/Research/namd/3.0/notes.html.

    Note a SLURM script has been included in the benchmark directory
    called "submit.slurm" that was used to run the reference benchmark
    on Niagara.

 7. The code will automatically report the value of the number of
    nanoseconds simulated per walltime day (ns/day).

    NAMD will, in fact, report several of these values. One should
    take the geometric mean of these benchmark numbers for the
    benchmark, and report the value nanoseconds per day. 
    The nanoseconds per day value should be reported in the "NAMD"
     tab of the LPBM Schedule 1 spreadsheet.

 8.  All modified source code, Makefiles, output and solution files are 
     to be provided in with the response.
