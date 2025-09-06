#!/bin/bash
echo "Building llama.cpp with CPU-specific configurations"
cmake -B build_cpu  -DGGML_NATIVE=ON  -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF 