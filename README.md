# Benchmark Guidelines
Benchmarks required for the 2024 University of Toronto Large-Parallel Refresh (LP2) System procurement. The benchmark sources and specific run instructions are provided for each of the benchmarks below. Information on baseline, optimization and reporting of the benchmark scores is described in Schedule G of the procurement document.

# Large-Parallel Refresh System Benchmark (LP2BM)
The following 8 application benchmarks make up the Large-Parallel Refresh System Benchmark (LP2BM). Each benchmark includes the source codes or download links to source code, benchmark run requirements and the instructions for reporting results.

# HPCG
- The High Performance Conjugate Gradients [HPCG](https://www.hpcg-benchmark.org/) benchmark is designed to exercise computational and data access patterns that closely match a broad set of important scientific applications, and to give incentive to computer system designers to invest in capabilities that will have impact on the collective performance of these applications. 
- HPCG is an open source benchmark developed by Mike Heroux, Jack Dongarra and Piotr Luszcze. 
- The source code can be downloaded [here](https://github.com/hpcg-benchmark/hpcg/archive/refs/tags/HPCG-release-3-1-0.tar.gz). (md5sum: bebe50185b365daf7b6b60f26ef3a390)
- LP2BM specific instructions can be found in the [hpcg](hpcg) directory.

# NekRS
- [NekRS](https://nek5000.mcs.anl.gov/) is an open source, fast and highly scalable computational fluid dynamics (CFD) solver targeting HPC applications.
- Developed at Argonne National Laboratory, NekRS is released under the terms of the BSD 3-clause license.
- The source code can be downloaded [here](https://github.com/Nek5000/nekRS/archive/refs/tags/v23.0.tar.gz). (md5sum: 475131966c187ccfda72f1a8a20ef36f)
- LP2BM specific instructions can be found in the [nekrs](nekrs) directory.
- The reported NekRS benchmark results must be run on a minimum of 50 CPU nodes.

# NAMD
- [NAMD](http://www.ks.uiuc.edu/Research/namd/) is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems.
- NAMD is Licensed under the [University of Illinois NAMD Molecular Dynamics Software Non-Exclusive, Non-Commercial Use License](http://www.ks.uiuc.edu/Research/namd/license.html)
- NAMD version 3.0b6  source, and/or binary packages, must be obtained directly from the Theoretical and Computational Biophysics Group at UIUC [here](https://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD).
- The benchmark to be used is the simulation of the "Satellite Tobacco Mosaic Virus" found [here](http://www.ks.uiuc.edu/Research/namd/utilities/).
- LP2BM specific instructions and input files can be found in the [namd](namd) directory.
- The reported NAMD benchmark results must be run on a minimum of 50 CPU nodes.

# WRF
- The Weather Research and Forecasting (WRF) Model is a next-generation mesoscale numerical weather prediction system designed for both atmospheric research and operational forecasting needs.
- WRF is public domain, details [here](https://www.mmm.ucar.edu/models/wrf).
- Source can be downloaded [here](https://github.com/wrf-model/WRF/releases).
- LP2BM specific instructions and input files can be found in the [wrf](wrf) directory.
- The reported WRF benchmark results must be run on a minimum of 50 CPU nodes
  
# GROMACS (GPU)
- [GROMACS](https://www.gromacs.org/) (GROningen MAchine for Chemical Simulations) is a versatile package used primarily for molecular dynamics simulations of biomolecules, such as proteins, lipids, and nucleic acids. It is designed to perform simulations of large biomolecular systems with high efficiency on CPUs, GPUs, and specialized hardware. GROMACS provides a wide range of functionalities for simulating molecular systems, including energy minimization, molecular dynamics simulations, free energy calculations, and analysis tools for studying the dynamics and properties of biomolecules at the atomic level. It is widely used in various fields such as biochemistry, biophysics, pharmaceutical research, and materials science.
- The reported GROMACS benchmark results must be run on a minimum of 4 GPUs.

## Installation
```
cd gromacs
sh build_gromacs.sh
```

## Benchmarking
```
sbatch run_benchmark_job.sh
```

# Quantum Espresso

- [Quantum Espresso](https://www.quantum-espresso.org) is an integrated suite of Open-Source computer codes for electronic-structure calculations and materials modeling at the nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials.
- The reported Quantum Espresso benchmark results must be run on a minimum of 50 CPU nodes.

# MLPerf
- [MLPerf](https://mlcommons.org/) is an industry-standard benchmark suite for measuring the performance of machine learning tasks.
- It is developed by MLCommons, a consortium of AI leaders from academia, research labs, and industry.
- The benchmark measures how fast a system can train models to a target quality metric.
- LP2BM specific instructions can be found in the [mlperf](mlperf) directory.
- The reported MLPerf benchmark results must be run on a minimum of 16 GPUs.

# SPEC MPI 2007 version 2.0.1, Large version
- The Standard Performance Evaluation Corporation [SPEC](https://www.spec.org/) is a non-profit consortium that establishes, maintains and endorses standardized benchmarks and tools to evaluate performance for the newest generation of computing systems.

- One of SPEC's benchmarks, [SPEC MPI 2007](https://www.spec.org/mpi2007/), provides a set of application benchmark suites for evaluating MPI-parallel, floating point, compute intensive performance across a wide range of cluster and SMP hardware. 

- To download the SPEC MPI 2007 please register at its website [https://www.spec.org/mpi2007](https://www.spec.org/mpi2007/).

- Please refer to their documentation site [here](https://www.spec.org/mpi2007/Docs/) and installation guide [here](https://www.spec.org/mpi2007/Docs/install-guide-unix.html).

- Follow their run and reporting rules on this [link](https://www.spec.org/mpi2007/Docs/runrules.html) and report back the scores for the base build along with the system description, configuration file and any other script setting the environment needed to reproduce the benchmark. 

- The reported SPEC MPI benchmark results must be run on the closest number of whole nodes to achieve 8192 MPI ranks.

# SPEChpc 2021 Large Workload

- The Standard Performance Evaluation Corporation [SPEC](https://www.spec.org/) is a non-profit consortium that establishes, maintains and endorses standardized benchmarks and tools to evaluate performance for the newest generation of computing systems.

- One of SPEC's benchmarks, [SPEChpc 2021 Benchmark Suites](https://www.spec.org/hpc2021/), provides a set of application benchmark suites using a comprehensive measure of real-world performance for the state-of-the-art HPC systems. They offer well-selected science and engineering codes that are representative of HPC workloads and are portable across CPU and accelerators, along with certain fair comparative performance metrics.  

- To download the SPEChpc 2021 Benchmark Suites please register at its website [https://www.spec.org/hpc2021/](https://www.spec.org/hpc2021/).

- Please refer to their documentation site [here](https://www.spec.org/hpc2021/docs/overview.html) and installation guide [here](https://www.spec.org/hpc2021/docs/install-guide-linux.html).

- Follow their run and reporting rules on this [link](https://www.spec.org/hpc2021/docs/runrules.html) and report back the scores for the base build along with the system description, configuration file and any other script setting the environment needed to reproduce the benchmark. 
