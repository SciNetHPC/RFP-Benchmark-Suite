# NAMD Benchmark

These are the instructions for performing the NAMD part of the
benchmarks for the SciNet LP2BM required for the LP RFP.  This part of
the benchmark suite performs a molecular dynamics simulation of the
Satellite Tobacco Mosaic Virus, which is a virus composed of roughly
1 million atoms.

# How to Run the Benchmark

 1. Get version 3.0b6 of the NAMD application.
    Main source and pre-built binaries can be found at:

    https://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD
    (md5sum: 98764e65e1b3957e67fe09f3b94e8782)

    One needs to register to get the code or binaries.

 2. Make sure an mpirun or mpiexec command is available.

    (In the reference benchmark, openmpi/4.1.4, compiled with
    gcc/11.3.0, was used to provide an mpirun command.)
 
 3. The code can be compiled following the instructions here:

    https://www.ks.uiuc.edu/Research/namd/development.html

    There is a list of commands that were run to build NAMD on Niagara
    in the [`build_namd.sh`](build_namd.sh) file. Note two versions (--with-memopt and without)
    need to be compiled in order to generate and run the input files.
 
 4. The benchmark input files are from https://www.ks.uiuc.edu/Research/namd/benchmarks/
    and can be downloaded from

    https://www.ks.uiuc.edu/Research/namd/utilities/stmv.tar.gz
    (md5sum: ef1c9362fc6dbc02dc8f01176c29075a)

    and

    https://www.ks.uiuc.edu/Research/namd/utilities/stmv_sc14.tar.gz
    (md5sum: b377a126718aac59c22ca6799a3c9c05)

    Untar both files and copy all of the files from the stmv directory:

        par_all27_prot_na.inp
        stmv.pdb
        stmv.psf
        stmv.namd

    into the `stmv_sc14` directory.

 5. To generate the inputs first generate multiple copies of the STMV
    structure by running in the `stmv_sc14` directory:

        $NAMD_BIN_WITHOUT_MEMOPT/psfgen make_210stmv.pgn

    then compress the STMV structure with:

        $NAMD_BIN_WITHOUT_MEMOPT/namd3 compress_210stmv

    more instructions can be found in the README file inside the stmv_sc14 directory.

 5. IMPORTANT: increase the "numsteps" parameter (the last parameter
    in the configuration file "stmv_sc14/210stmv2fs.namd") from 1200 to get
    adequate sampling of runtimes. For example the reference benchmark
    on Niagara was ran for 3600 steps.

 6. To run the benchmark, execute:

        $NAMD_BIN_WITH_MEMOPT/charmrun ++p $NCORES $NAMD_BIN/namd3 $PWD/210stmv2fs.namd

    Here, `$NAMD_BIN_WITH_MEMOPT` should be the directory containing the namd binary
    and related utilities compiled with memory optimisation, and
    `$NCORES` should be the number of parallel processes to use. `$NCORES`
    should be set such that the number of processes is equal to the number of
    nodes used times the number of cores per node, subject to the constraint that
    the number of nodes is at least 50.

    The above command line assumes that mpi has been setup such that
    mpirun will launch on a set number of nodes, with as many
    processes per node as it has cores.  Alternatively, one can pass a
    `++nodelist` command. Details of this way of starting a namd run are
    described in https://www.ks.uiuc.edu/Research/namd/3.0/notes.html.

    Note a SLURM script has been included in the benchmark directory
    called [`submit.slurm`](submit.slurm) that was used to run the reference benchmark
    on Niagara.

    More instructions can be found in the README file inside the stmv_sc14 directory.

    Note the reference benchmark run on 100 nodes of Niagara used ~50GB of memory per node.

 7. The code will automatically report the value of the number of
    nanoseconds simulated per walltime day (ns/day).

    NAMD will, in fact, report several of these values. One should
    take the geometric mean of these benchmark numbers for the
    benchmark, and report the value nanoseconds per day.
    The nanoseconds per day value should be reported in the "NAMD"
    tab of the LP2BM Schedule G spreadsheet.

 8. All modified source code, Makefiles, output and solution files are
    to be provided in with the response.

