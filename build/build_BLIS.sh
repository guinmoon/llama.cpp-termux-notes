#!/bin/bash
echo "Building BLIS"

git clone https://github.com/flame/blis
cd blis
./configure -p /data/data/com.termux/files/usr/ --enable-cblas -t openmp,pthreads auto
make -j3
make install
cd ..

echo "Building llama.cpp with CPU + BLIS configurations"
cmake -B build_blis -DGGML_NATIVE=ON  -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=FLAME -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/
cmake --build build_blis --config Release -j3