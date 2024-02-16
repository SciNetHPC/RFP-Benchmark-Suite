
===========================================================
High Performance Conjugate Gradient Benchmark for 
===========================================================

== I. 	Description: ==

HPCG is a software package that performs a fixed number of multigrid preconditioned
(using a symmetric Gauss-Seidel smoother) conjugate gradient (PCG) iterations using double
precision (64 bit) floating point values.


== II. Parallelism: ==

HPCG implements MPI-based node distributed parallelism and OpenMP threading within the
MPI rank. OpenMP parallel-for regions are used for most vector and matrix operations
with the main SpMV threaded over matrix rows.

== III. How to Build: == 

(1) Create an architecture reference file in the setup directory. Examples are provided
for Linux platforms with MPI and OpenMP using a variety of compilers. For instance, name
this file Make.Linux_LPBM.

(2) In the Makefile in the base directory modify the arch = variable to state Linux_LPBM.

(3) Run make

(4) The xhpcg binary will be created in the bin directory

(5) For the reference benchmark on Niagara Make.Linux_MPI was used with intelmpi/2022u2 
compiled with intel/2022u2 compiler.

== IV.  How to Run: == 

HPCG takes the problem size definition from command line arguments: 

--nx, --ny, --nz, --rt

The "nx", "ny" and "nz" variables define the problem size per MPI rank and "rt" value specifies 
how long the benchmark should execute for. 

The base LPBM reference mesh size per MPI rank has been defined at: 56 216 376. The
output of HPCG describes the global mesh size which takes the per-node mesh size and rank
decomposition to calculate the global sizes. Weak scaling is used to increase the size of
the mesh. A "rt" value of 1800 must be used for the benchmark to report a valid result in
machine acceptance. Projected responses based on simulation or other performance models
may be run with a shorter time as needed but final acceptance of applications will
require the longer, 1800 second base run.

Global Problem Size Definition:

LPBM Size - 560 4320 7520
Full System Size - minimum 1/4 system memory 

Mapping of MPI ranks to nodes or global mesh decomposition over nodes can be modifed by
the user as required but the final mesh must meet the size above exactly.

An example SLURM submission script (submit.slurm) used on Niagara is provided as a reference.

== V.	Reporting Results ==

HPCG will produce a .txt file in the directory where it is run with performance 
summaries of the data, e.g. HPCG-Benchmark_3.1_2024-02-14_15-18-20.txt. In the "Final Summary" 
section located at the bottom of the YAML file is a GFLOP/s value. HPCG will also self report 
a VALID or INVALID result. Only VALID results are to be provided in the RFP response.

The GFLOP/s value in the Final Summary should be reported in the "HPCG" tab of the LPBM Schedule 1
spreadsheet.

All modified source code, added Makefiles, output and .yaml files are to be provided in with the
response.

Reporting of ouptut to http://hpcg-benchmark.org is NOT required for the purposes of this RFP.
