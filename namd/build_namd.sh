tar xaf NAMD_3.0b6_Source.tar.gz  
cd NAMD_3.0b6_Source
tar xaf charm-7.0.0.tar 
ml NiaEnv/2022a gcc openmpi cmake
cd charm-v7.0.0
env MPICXX=mpicxx ./build charm++ mpi-linux-x86_64 --with-production
cd ..
wget http://www.ks.uiuc.edu/Research/namd/libraries/fftw-linux-x86_64.tar.gz
wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.6.13-linux-x86_64.tar.gz
wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.6.13-linux-x86_64-threaded.tar.gz
tar xzf fftw-linux-x86_64.tar.gz 
tar xzf tcl8.6.13-linux-x86_64.tar.gz 
tar xzf tcl8.6.13-linux-x86_64-threaded.tar.gz 
mv linux-x86_64/ fftw
mv tcl8.6.13-linux-x86_64 tcl
mv tcl8.6.13-linux-x86_64-threaded tcl-threaded
./config Linux-x86_64-g++ --charm-arch mpi-linux-x86_64
cd Linux-x86_64-g++/
make -j 6
./namd3 
