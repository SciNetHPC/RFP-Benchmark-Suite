# Benchmark Guidelines
Benchmarks required for the 2024 University of Toronto Large Parallel System procurement. The benchmark sources and specific run instructions are provided for each of the benchmarks below. Information on baseline, optimization and reporting of the benchmark scores is described in Schedule 1 of the procurement document.

# Large Parallel Benchmark (LPBM)
The following X (X) application benchmarks make up the Large Parallel Benchmark (LPBM). Each benchmark includes the source codes or download links to source code, benchmark run requirements and the instructions for reporting results.

# HPCG
- The High Performance Conjugate Gradients [HPCG](https://www.hpcg-benchmark.org/) benchmark is designed to exercise computational and data access patterns that closely match a broad set of important scientific applications, and to give incentive to computer system designers to invest in capabilities that will have impact on the collective performance of these applications. 
- HPCG is an open source benchmark developed by Mike Heroux, Jack Dongarra and Piotr Luszcze. 
- Source and LPBM specific instructions can be found in the [hpcg](hpcg) directory.

# NekRS
- [NekRS](https://nek5000.mcs.anl.gov/) is an open source, fast and highly scalable computational fluid dynamics (CFD) solver targeting HPC applications.
- Developed at Argonne National Laboratory, NekRS is released under the terms of the BSD 3-clause license.
- The source code can be downloaded [here](https://github.com/Nek5000/nekRS/archive/refs/tags/v23.0.tar.gz). (md5sum: 475131966c187ccfda72f1a8a20ef36f)
- LPBM specific instructions can be found in the [nekrs](nekrs) directory.

# NAMD
- [NAMD](http://www.ks.uiuc.edu/Research/namd/) is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems.
- NAMD is Licensed under the [University of Illinois NAMD Molecular Dynamics Software Non-Exclusive, Non-Commercial Use License](http://www.ks.uiuc.edu/Research/namd/license.html)
- NAMD version 3.0b6  source, and/or binary packages, must be obtained directly from the Theoretical and Computational Biophysics Group at UIUC [here](https://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD).
- The benchmark to be used is the simulation of the "Satellite Tobacco Mosaic Virus" found [here](http://www.ks.uiuc.edu/Research/namd/utilities/).
- LPBM specific instructions and input files can be in the [namd](namd) directory.

# WRF

# GROMACS (GPU)

# Quantum Espresso

# MLPerf Training BERT-large (for Flash Attention)

# Alphafold

# SPEC MPI 2007 version 2.0.1, Large version
