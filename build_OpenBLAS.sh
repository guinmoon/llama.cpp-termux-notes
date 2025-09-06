#!/bin/bash
echo "Building llama.cpp with CPU + OpenBLAS configurations"
cmake -B build_openblas  -DGGML_NATIVE=ON  -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas