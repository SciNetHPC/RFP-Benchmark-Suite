# SPEChpc 2021 Large Workload Benchmark

## Description

The [SPEChpc 2021 Large Workload Benchmark](https://www.spec.org/hpc2021/docs/index.html#suites) is intended to target a larger cluster of nodes using between 2048 and 32,768 ranks. It uses a maximum of 14.5TB of memory per benchmark. It comprises 6 codes to be benchmarked: 

   1. [805.lbm_l](https://www.spec.org/hpc2021/docs/benchmarks/805.lbm_l.html): D2Q37 is a Computational Fluid Dynamics code for simulating 2D-fluids using the Lattice Boltzmann Method (LBM) with 37 components of velocity. 

   2. [818.tealeaf_l](https://www.spec.org/hpc2021/docs/benchmarks/818.tealeaf_l.html): TeaLeaf is a mini-app that solves the linear heat conduction equation on a spatially decomposed regular grid using a 5 point stencil with implicit solvers. TeaLeaf currently solves the equations in two dimensions. 

   3. [819.clvleaf_l](https://www.spec.org/hpc2021/docs/benchmarks/819.clvleaf_l.html): CloverLeaf is a mini-app that solves the compressible Euler equations on a Cartesian grid, using an explicit, second-order accurate method. Each cell stores three values: energy, density, and pressure. A velocity vector is stored at each cell corner. This arrangement of data, with some quantities at cell centers, and others at cell corners is known as a staggered grid. CloverLeaf currently solves the equations in two dimensions. 

   4. [828.pot3d](https://www.spec.org/hpc2021/docs/benchmarks/828.pot3d_l.html): POT3D computes potential field solutions used to approximate the 3D solar coronal magnetic field using observed photospheric magnetic fields as a boundary condition. It is used for numerous studies of coronal structure and dynamics.

   5. [834.hpgmgfv_l](https://www.spec.org/hpc2021/docs/benchmarks/834.hpgmgfv_l.html): High Performance Geometric Multigrid (HPGMG-FV) is a benchmark designed to proxy the finite-volume based geometric multigrid linear solvers found in adaptive mesh refinement (AMR) based applications like Nyx, Castro, Maestro, IAMR and PeleLM. HPGMG-FV solves variable-coefficient elliptic problems on Cartesian grids using the finite volume method (FV). The method is fourth-order accurate.

  6. [835.weather_l](https://www.spec.org/hpc2021/docs/benchmarks/835.weather_l.html): The miniWeather code mimics the basic dynamics seen in atmospheric weather and climate. The dynamics themselves are dry compressible, stratified, non-hydrostatic flows dominated by buoyant forces that are relatively small perturbations on a hydrostatic background state. The equations in this code themselves form the backbone of pretty much all fluid dynamics codes, and this particular flavor forms the base of all weather and climate modeling. 


## How to Build

1. Register at the SPEC benchmark [website](https://www.spec.org/hpc2021/). In at most two business days you should receive an email with the license number and instructions on how to retrieve the SPEC distribution media, an ISO image.

2. Download the SPEC distribution media (ISO image) as instructed in the SPEC email.

3. Mount the ISO image in the local file system. Example on a linux laptop:

```bash
   $ sudo mount -o loop hpc2021-1.1.8.iso /home/path/to/src/SPEC/extract/hpc2021/
```

4. Navigate to the mounted SPEC distribution media (ISO image) and set the installation directory:

```bash
   $ INSTALL_DIR=/scratch/path/to/SPEC/gcc_11.3.0_openmpi_4.1.4_ucx-1.11.2/hpc2021
   $ pwd
   /home/path/to/src/SPEC/extract/hpc2021
   $ ./install.sh -d $INSTALL_DIR
```

5. Load the compiler and MPI modules with the environment:

```bash
   $ ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2
```

6. Navigate to the installation directory and source the SPEC environment:

```bash
   $ cd $INSTALL_DIR
   $ source shrc
   $ cd $SPEC/config
```

7. Edit the appropriate SUT.inc file and an Example.cnf configuration files in the $SPEC/config directory. As a reference we include here niagara.inc and gnu.cnf configuration files used in our runs.

8. Build the benchmark applications:

```bash
   $ runhpc --config=gnu.cfg --action=build --tune=base --ranks 40 large
```
For convenience we provide a build script for the reference benchmark, [build_hpc2021.sh](build_hpc2021.sh). Modify its INSTALL_DIR and NTASKS variables according to your system specifications and run **build_hpc2021.sh** to build the **large** benchmark.


## How to Run

The basic command to run the large workload is as follows:

```bash
   $ runhpc --config=gnu.cfg --flagsurl=$SPEC/config/flags/gcc_flags.xml --ranks $SLURM_NTASKS --reportable --tune=base --pmodel MPI large

```

### Description of the options

  1. The --config option selects the compiler and MPI stack options to be used in the test. In our reference benchmark we used GNU compilers and OpenMPI MPI stack. Make sure to edit the configuration file to satisfy your system's and compiler's specifications. We include the gnu.cfg compiler/MPI configuration file, gnu.cfg, and its system's companion, niagara.inc, as a reference here. Detailed information on how to write such files can be found at SPEC's [config file website](https://www.spec.org/hpc2021/docs/config.html).

  2. The --flagsurl option sets the path for a XML file explaining the compiler's options used in the test. In our case we explicitly use the gcc compiler flags shipped with the distribution: $SPEC/config/flags/gcc_flags.xml. More details on how to build the XML flag description file for your compiler, please refer to SPEC's [flag description file website](https://www.spec.org/hpc2021/docs/flag-description.html)

  3. The --ranks option sets the total number of MPI tasks to run the benchmark on. On a slurm script the slurm variable SLURM_NTASKS can set that value automatically.

  4. The --reportable option tells the running system to produce a report at the end. Please keep it and submit its output.

  5. The --tune=base option applies the run rules for the base case. It is mandatory to follow the run rules as specified on SPEC's [run and reporting rules website](https://www.spec.org/hpc2021/docs/runrules.html)

  6. The --pmodel chooses the parallel model of the benchmark. For the purposes of this RFP please use the default: MPI.

  7. Finally the benchmark should be run for the **large** workload.

### Reference Benchmark

1. Load the compiler and MPI modules with the environment:

```bash
   $ ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2
```

2. Navigate to the installation directory and source the SPEC environment:

```bash
   $ cd $INSTALL_DIR
   $ source shrc
   $ cd $SPEC/config
```

3. Run the benchmark on 8192 cores, or the minimum number of wholesome nodes to reach that number:

```
runhpc --config=gnu.cfg --flagsurl=$SPEC/config/flags/gcc_flags.xml --ranks 8192 --reportable --tune=base --pmodel MPI large

``` 
For convenience we provide a slurm submit script for the reference benchmark, [submit_hpc2021_large_N205_n8192.sh](submit_hpc2021_large_N205_n8192.sh). Modify its INSTALL_DIR, the number of nodes (or tasks), partition and account according to your system specifications and submit to slurm **submit_hpc2021_large_N205_n8192.sh** to run the large workload benchmark.


## Reporting Results

SPEChpc 2021 Large Workload Benchmark outputs its results to the **$SPEC/result** directory. For example, our reference benchmark run wrote its results as **$SPEC/result/hpc2021_lrg.017.large.txt** file. The following steps guide you on reporting the results from this file:

   1. Open the file and read the SPEChpc 2021_lrg_base score.
   2. Enter that score in the **SPEChpc** tab of the LP2BM Schedule G spreadsheet.
   3. Submit the scripts used to build and run the benchmark, the flag description XML file, the compiler/MPI configuration files, and the report and log produced by the benchmark as shown in the [sample_output](sample_output) directory for our reference run.


