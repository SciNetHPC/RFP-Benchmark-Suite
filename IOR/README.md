
===========================================================
HPC IOR Benchmark
===========================================================

== I. Description: ==

HPC IO Benchmark [IOR](https://ior.readthedocs.io/en/latest/) is a parallel IO benchmark that can be used to test the performance of parallel storage systems using various interfaces and access patterns. It uses a common parallel I/O abstraction backend and rely on MPI for synchronization.

== II. How to Build: == 

  (1) Download the latest IOR release from their public git repository on github:

     - wget https://github.com/hpc/ior/releases/download/4.0.0/ior-4.0.0.tar.gz

  (2) Extract the tarball in the local source code directory:

     - tar -xzf ior-4.0.0.tar.gz

  (3) Configure where you want to install it:

     - cd ior-4.0.0
     - ./configure --prefix=/path/to/install/directory

  (4) Build and install IOR:

    - make -j
    - make install

  (5) The above steps are included as a reference in the build_IOR.sh script on [benchmark](benchmark) directory.

== III. How to Run: == 

We ask to run 4 different cases to benchmark 2 different IOR apis: posix and mpiio. The basic command line to run IOR is as follows:

  - mpirun /path/to/ior -vv -o /path/to/data/file/test -l=random -M=70% -a=posix -b=8g -t=16m -i=2 -g -d=10 -e -C -Q=40

  * Description of the options:

     - The -vv option just increases the verbosity of the output. It should be kept as it is.

     - The -o /path/to/data/file/test sets the path where the data file or files will be created. You are free to update the path as long as it is a path on the storage appliance being tested.

     - The -l=random option is a new flag released on IOR version 4.0.0 only at the moment. It adds randomized block support using the golden prime method also used by another IO benchmark tool, [elbencho](https://github.com/breuner/elbencho). Different storage systems might have different compression/deduplication/cache capabilities. While these features are important in production, they might skew the real storage bandwidth capabilities, which is what we would like to benchmark here. This option must be kept as it is.

     - The -M=70% option tells IOR to allocate 70% of the memory available on the nodes simulating what a real application might allocate. This option helps the kernel to evict cache pages from the memory as the test proceeds. This option must be kept as it is.

     - The -a=posix option selects the IOR api to be used. In this case posix. The other option to be tested is mpiio IOR api. There are 4 reference submission scripts in the [benchmark](benchmark) directory where the different apis are used with different options. Please base your submission scripts on the options used there.

     - The -b=8g option sets the block size that each MPI task will write to the storage system. This option must be kept as it is.

     - The -t=16m option defines the transfer size of the data for each input/ouput operation (IOP). For each of the 4 cases you need to run for transfer sizes of 1m, 4m and 16m. Submission scripts for 16m for the 4 cases are [benchmark](benchmark) directory as well as their output on [benchmark/sample_output](benchmark/sample_output) directory. The were run on an empty system for our burst buffer storage appliance.

     - The -i=2 tells IOR to run two iterations of the read and write tests. Please keep it as it is.

     - The -g option uses barriers between open, write/read, and close. Please keep it as it is.

     - The -d=10 option delays 10 seconds between the test iterations. Please keep it as it is.

     - The -e option performs fsync upon POSIX write close. It is very important to flush the write cache page from memory to the storage in order to properly measure the storage performance and not the memory write performance. This option must be kept as it is.

     - The -C option changes the MPI task ordering while reading back the data that each task wrote before. This is also a very important option to circumvent reading from memory page cache instead from the storage appliance. This option must be kept as it is.

     - The -Q=40 option instructs -C option to change the task read back ordering by n+40, where 40 is the number of tasks per node used in the reference examples. The idea is to make sure that any task in the node will only read data written by tasks from another node. This option might be modified to update the number of tasks used per node, but it must be present in the reported results.




== IV. Reporting Results ==

Test

