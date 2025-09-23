#!/bin/bash
echo "Building llama.cpp with CPU + KleidiAI configurations"
cmake -B build_kleidi -DGGML_NATIVE=ON -DGGML_CPU_KLEIDIAI=ON -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF 
cmake --build build_kleidi --config Release -j3