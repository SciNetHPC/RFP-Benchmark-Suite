#!/bin/bash
module load cmake/3.27.8 # min 3.18.4 required
module load gcc/12.3.0
module load cuda/12.3.1

mkdir gromacs_installation
cd gromacs_installation

wget https://ftp.gromacs.org/pub/gromacs/gromacs-2024.tar.gz

md5sum --check <<<"6fd5bedba9f84e5b397b4cbe5720ae1e gromacs-2024.tar.gz"

tar -xaf gromacs-2024.tar.gz

cd gromacs-2024

mkdir build
cd build

cmake .. \
    -DCMAKE_INSTALL_PREFIX="${HOME}/gromacs" \
    -DGMX_BUILD_OWN_FFTW=ON \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_OPENMP=ON \
    -DGMX_GPU=CUDA

# on balam
make -j 128
make -j 128 check
make install

export $gmx="$HOME/software/gromacs/bin/gmx"

$gmx
