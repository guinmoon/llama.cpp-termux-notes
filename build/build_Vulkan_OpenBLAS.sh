#!/bin/bash
echo "Building llama.cpp with OpenCL configurations"
cmake -B build_vk_blas -DGGML_VULKAN=ON -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DGGML_NATIVE=ON -DBUILD_SHARED_LIBS=OFF  -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas;/data/data/com.termux/files/usr/include/vulkan
cmake --build build_vk_blas --config Release -j3