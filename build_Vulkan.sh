#!/bin/bash
echo "Building llama.cpp with OpenCL configurations"
cmake -B build_vk -DGGML_VULKAN=ON -DGGML_NATIVE=ON -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas;/data/data/com.termux/files/usr/include/vulkan