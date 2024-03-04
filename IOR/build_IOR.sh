#!/bin/bash

# Load compiler and MPI modules with environment on Niagara:
ml NiaEnv/2022a gcc/11.3.0 openmpi/4.1.4+ucx-1.11.2

# Set installation directory:
INSTALL_DIR=/bb/path/to/ior/gcc_11.3.0_openmpi_4.1.4+ucx-1.11.2/

# Retrieve the latest release:
wget https://github.com/hpc/ior/releases/download/4.0.0/ior-4.0.0.tar.gz

# Extract the tarball:
tar -xzf ior-4.0.0.tar.gz

# Configure:
cd ior-4.0.0
./configure --prefix=$INSTALL_DIR

# Build and install:
make -j
make install

