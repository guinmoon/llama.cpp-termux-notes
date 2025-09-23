#!/bin/bash
echo "Building llama.cpp with OpenCL+OpenBLAS configurations"
cmake -B build_opencl_openblas -DGGML_OPENCL=ON -DGGML_NATIVE=ON -DBUILD_SHARED_LIBS=OFF -DGGML_OPENCL_USE_ADRENO_KERNELS=ON -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas
cmake --build build_opencl_openblas --config Release -j3
echo "use LD_LIBRARY_PATH=./:$PREFIX/lib ./build_opencl/bin/llama-cli"
cp /vendor/lib64/libOpenCL.so .