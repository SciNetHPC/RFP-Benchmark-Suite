# HPC IOR Benchmark

## Description

HPC IO Benchmark [IOR](https://ior.readthedocs.io/en/latest/) is a parallel IO benchmark that can be used to test the performance of parallel storage systems using various interfaces and access patterns. It uses a common parallel I/O abstraction backend and rely on MPI for synchronization.

## How to Build

  1. Download the latest IOR release from their public git repository on github:

      ```
         $ wget https://github.com/hpc/ior/releases/download/4.0.0/ior-4.0.0.tar.gz
      ```

  2. Extract the tarball in the local source code directory:

      ```
         $ tar -xzf ior-4.0.0.tar.gz
      ```

  3. Configure where you want to install it:

      ```
         $ cd ior-4.0.0
         $ ./configure --prefix=/path/to/install/directory
      ```

  4. Build and install IOR:

      ```
         $ make -j
         $ make install
      ```

  5. The above steps are included as a reference in the [**build_IOR.sh**](build_IOR.sh) script.

## How to Run

We propose 4 different cases to benchmark 2 different IOR apis: posix and mpiio. The basic command line to run IOR is as follows:

```
    $ mpirun /path/to/ior -vv -o /path/to/data/file/test -l=random -M=70% -a=posix -b=8g -t=16m -i=2 \
      -g -d=10 -e -C -Q=40
```

### Description of the options

  1. The -vv option just increases the verbosity of the output. It should be kept as it is.

  2. The -o /path/to/data/file/test sets the path where the data file or files will be created. You are free to update the path as long as it is a path on the storage appliance being tested.

  3. The -l=random option is a new flag released on IOR version 4.0.0 only at the moment. It adds randomized block support using the golden prime method also used by another IO benchmark tool, [elbencho](https://github.com/breuner/elbencho). Different storage systems might have different compression/deduplication/cache capabilities. While these features are important in production, they might skew the real storage bandwidth capabilities, which is what we would like to benchmark here. This option must be kept as it is.

  4. The -M=70% option tells IOR to allocate 70% of the memory available on the nodes simulating what a real application might allocate. This option helps the kernel to evict cache pages from the memory as the test proceeds. This option must be kept as it is.

  5. The -a=posix option selects the IOR api to be used. In this case posix. The other option to be tested is mpiio IOR api. There are 4 reference submission scripts in this directory where the different apis are used with different options. Please base your submission scripts on the options used there.

  6. The -b=8g option sets the block size that each MPI task will write to the storage system. This option must be kept as it is.

  7. The -t=16m option defines the transfer size of the data for each input/ouput operation (IOP). For each of the 4 cases you need to run for transfer sizes of 1m, 4m and 16m. Submission scripts for 16m transfer size for the 4 cases are included in this directory as well as their output on [sample_output](sample_output) directory. They were run on an empty system for our burst buffer storage appliance.

  8. The -i=2 tells IOR to run two iterations of the read and write tests. Please keep it as it is.

  9. The -g option uses barriers between open, write/read, and close. Please keep it as it is.

  10. The -d=10 option delays 10 seconds between the test iterations. Please keep it as it is.

  11. The -e option performs fsync upon POSIX write close. It is very important to flush the write cache page from memory to the storage in order to properly measure the storage performance and not the memory write performance. This option must be kept as it is.

  12. The -C option changes the MPI task ordering while reading back the data that each task wrote before. This is also a very important option to circumvent reading from memory page cache instead from the storage appliance. This option must be kept as it is.

  13. The -Q=40 option instructs -C option to change the task read back ordering by n+40, where 40 is the number of tasks per node used in the reference examples. The idea is to make sure that any task in the node will only read data written by tasks from another node. This option might be modified to update the number of tasks used per node, but it must be present in the reported results.

### IOR Benchmark Cases

All cases below are to be run for 3 different transfer sizes: 1MB, 4MB, and 16MB, totalling 12 benchmark runs. The base command is the same as above with some small option adjustments:

  1. **Case 1:** It uses the default IOR posix api with a single shared file. The reference submit script is the **ior_posix_N0072_n40_t16m.sh** script on this directory and it encodes the base command explained above for the transfer size of 16MB.

  2. **Case 2:** It still uses the default IOR posix api but with one file file per process being directly accessed to. It adds the options -F and --posix.odirect to the case 1 example. The reference submit script is the **ior_posix.odirect-F_N0072_n40_t16m.sh** script on this directory and it encodes this case for the transfer size of 16MB.

  3. **Case 3:** It uses the IOR mpiio api with a single shared file. It modifies case 1 options to mpiio api: -a=mpiio. The reference submit script is the **ior_mpiio_N0072_n40_t16m.sh** script on this directory and it encodes this case for the transfer size of 16MB.

  4. **Case 4:** It uses the IOR mpiio api with a single shared file, but it instructs IOR to use mpiio FileView. It adds the mpiio option to case 3 options: --mpiio.useFileView. The reference submit script is the **ior_mpiio.useFileView_N0072_n40_t16m.sh** script on this directory and it encodes this case for the transfer size of 16MB.

## Reporting Results

IOR outputs its results to standard output which the reference scripts redirect to a file on the same directory they were executed. The following steps guide you on reporting the results from this file:

   1. Open the file and double check the options match the required ones for each of the cases run. 
   2. Scroll down to the **Results:** session and collect at the end of it the read and write maximum values in MB per second for the two test iterations.
   3. Scroll down even further to the **Summary of all tests:** session and collect the maximum read and write values for IOPs in number of input/output operations per second.
   4. Enter those values in the **HPL,IOR** tab of the LP2BM Schedule G spreadsheet.
   5. Repeat the process for transfer sizes of 1MB, 4MB and 16MB for each of the 4 cases mentioned above.

All makefiles, scripts, environment settings, and source code patches (if any), along with the raw output of the benchmark runs must be provided with the response. Sample output for the reference benchmark can be found at the [sample_output](sample_output) directory.

