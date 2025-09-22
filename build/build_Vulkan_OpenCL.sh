#!/bin/bash
echo "Building llama.cpp with OpenCL configurations"
cmake -B build_vk_opencl -DGGML_VULKAN=ON -DGGML_NATIVE=ON -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DGGML_OPENCL=ON -DGGML_OPENCL_USE_ADRENO_KERNELS=ON -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas;/data/data/com.termux/files/usr/include/vulkan
cmake --build build_vk_opencl --config Release -j3
echo "use LD_LIBRARY_PATH=./:$PREFIX/lib ./build_opencl/bin/llama-cli"
cp /vendor/lib64/libOpenCL.so . 