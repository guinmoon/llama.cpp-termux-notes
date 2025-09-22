#!/bin/bash
# Validate arguments
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required: model and type (cpu/openblas/blis/kleidi/openblas_kle/opencl/vk_opencl_openblas/vk)"
    echo "Example: $0 ./models/llama-7b.bin blis"
    exit 1
fi
MODEL="$1"
TYPE="$2"
# Check for specific build types in order of priority
if [[ "$TYPE" == *"openblas_kle"* ]]; then
    echo "Running OpenBLAS-KLE benchmarks (all cores)"
    ./build_openblas_kle/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running OpenBLAS-KLE benchmarks (cores 4,5,6,7)"
    taskset -c 4,5,6,7 ./build_openblas_kle/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running OpenBLAS-KLE benchmarks (cores 0,1,2,3)"
    taskset -c 0,1,2,3 ./build_openblas_kle/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
elif [[ "$TYPE" == *"blis"* ]]; then
    echo "Running BLIS benchmarks (all cores)"
    ./build_blis/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running BLIS benchmarks (cores 4,5,6,7)"
    taskset -c 4,5,6,7 ./build_blis/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running BLIS benchmarks (cores 0,1,2,3)"
    taskset -c 0,1,2,3 ./build_blis/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
elif [[ "$TYPE" == *"kleidi"* ]]; then
    echo "Running KLEIDI benchmarks (all cores)"
    ./build_kleidi/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running KLEIDI benchmarks (cores 4,5,6,7)"
    taskset -c 4,5,6,7 ./build_kleidi/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running KLEIDI benchmarks (cores 0,1,2,3)"
    taskset -c 0,1,2,3 ./build_kleidi/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1 
# elif [[ "$TYPE" == *"opencl_openblas"* ]]; then
#     echo "Running OpenCL-OpenBLAS benchmarks (all cores)"
#     LD_LIBRARY_PATH=./:$PREFIX/lib ./build_vk_opencl_openblas/bin/llama-bench -m "$MODEL" -t 3 -fa 1 -ngl 99 --device GPUOpenCL
#     sleep 90
#     echo "Running OpenCL-OpenBLAS benchmarks (cores 4,5,6,7)"
#     LD_LIBRARY_PATH=./:$PREFIX/lib taskset -c 4,5,6,7 ./build_vk_opencl_openblas/bin/llama-bench -m "$MODEL" -t 3 -fa 1 -ngl 99 --device GPUOpenCL
#     sleep 90
#     echo "Running OpenCL-OpenBLAS benchmarks (cores 0,1,2,3)"
#     LD_LIBRARY_PATH=./:$PREFIX/lib taskset -c 0,1,2,3 ./build_vk_opencl_openblas/bin/llama-bench -m "$MODEL" -t 3 -fa 1 -ngl 99 --device GPUOpenCL
elif [[ "$TYPE" == *"opencl"* ]]; then
    echo "Running OpenCL benchmarks (all cores)"
    LD_LIBRARY_PATH=./:$PREFIX/lib ./build_opencl/bin/llama-bench -m "$MODEL" -t 3  -fa 1 -ngl 99
    sleep 90
    echo "Running OpenCL benchmarks (cores 4,5,6,7)"
    LD_LIBRARY_PATH=./:$PREFIX/lib taskset -c 4,5,6,7 ./build_opencl/bin/llama-bench -m "$MODEL" -t 3  -fa 1
    sleep 90
    echo "Running OpenCL benchmarks (cores 0,1,2,3)"
    LD_LIBRARY_PATH=./:$PREFIX/lib taskset -c 0,1,2,3 ./build_opencl/bin/llama-bench -m "$MODEL" -t 3 -fa 1
elif [[ "$TYPE" == *"vk"* ]]; then
    echo "Running Vulkan benchmarks (all cores)"
    ./build_vk/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1 -ngl 99
    sleep 90
    echo "Running Vulkan benchmarks (cores 4,5,6,7)"
    taskset -c 4,5,6,7 ./build_vk/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1 -ngl 99
    sleep 90
    echo "Running Vulkan benchmarks (cores 0,1,2,3)"
    taskset -c 0,1,2,3 ./build_vk/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1 -ngl 99
elif [[ "$TYPE" == *"cpu"* ]]; then
    echo "Running CPU benchmarks (all cores)"
    ./build_cpu/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running CPU benchmarks (cores 4,5,6,7)"
    taskset -c 4,5,6,7 ./build_cpu/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running CPU benchmarks (cores 0,1,2,3)"
    taskset -c 0,1,2,3 ./build_cpu/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
elif [[ "$TYPE" == *"openblas"* ]]; then
    echo "Running OpenBLAS benchmarks (all cores)"
    ./build_openblas/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running OpenBLAS benchmarks (cores 4,5,6,7)"
    taskset -c 4,5,6,7 ./build_openblas/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
    sleep 90
    echo "Running OpenBLAS benchmarks (cores 0,1,2,3)"
    taskset -c 0,1,2,3 ./build_openblas/bin/llama-bench -m "$MODEL" -t 3 -ctk q8_0 -ctv q8_0 -fa 1
else
    echo "Error: Unknown build type '$TYPE'. Supported types: cpu, openblas, blis, kleidi, openblas_kle, opencl, vk_opencl_openblas, vk"
    exit 1
fi

LD_LIBRARY_PATH=./:$PREFIX/lib ./build_opencl/bin/llama-bench -m ~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf -ngl 26 -t 3


LD_LIBRARY_PATH=./:$PREFIX/lib ./build_vk_opencl/bin/llama-cli -m ~/storage/downloads/gemma-3-4b-it-q4_0-pure.gguf -ngl 34 -t 3 --main-gpu 1 -dev Vulkan0,GPUOpenCL --tensor-split 14,20 


./build_vk_opencl_openblas/bin/llama-cli -m ~/storage/downloads/gemma-3-4b-it-q4_0-pure.gguf -ngl 0 -t 3 -dev none -ctk q8_0 -ctv q8_0 -p "who are you?"
# /data/data/com.termux/files/home/llama.cpp-termux-notes/llama.cpp/
# -ctk q8_0 -ctv q8_0  cant be used with OpenCL
# ~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf 
# ~/storage/downloads/gemma-3-4b-it-q4_0-pure.gguf 




# LD_LIBRARY_PATH=./:$PREFIX/lib ./build_vk_opencl_openblas/bin/llama-cli --list-devices
# ggml_vulkan: Found 1 Vulkan devices:
# ggml_vulkan: 0 = Turnip Adreno (TM) 725 (turnip Mesa driver) | uma: 1 | fp16: 1 | bf16: 0 | warp size: 128 | shared memory: 32768 | int dot: 0 | matrix cores: none
# ggml_opencl: selected platform: 'QUALCOMM Snapdragon(TM)'

# ggml_opencl: device: 'QUALCOMM Adreno(TM) (OpenCL 3.0 Adreno(TM) 730)'
# ggml_opencl: OpenCL driver: OpenCL 3.0 QUALCOMM build: commit #2e251f7ab9 changeid #Iee84b1ed59 Date: 05/16/25 Fri Local Branch:  Remote Branch: refs/tags/AU_LINUX_ANDROID_LA.VENDOR.1.0.R1.11.00.00.816.269 Compiler E031.38.11.14
# ggml_opencl: vector subgroup broadcast support: false
# ggml_opencl: device FP16 support: true
# ggml_opencl: mem base addr align: 128
# ggml_opencl: max mem alloc size: 1024 MB
# ggml_opencl: device max workgroup size: 1024
# ggml_opencl: SVM coarse grain buffer support: true
# ggml_opencl: SVM fine grain buffer support: true
# ggml_opencl: SVM fine grain system support: false
# ggml_opencl: SVM atomics support: true
# ggml_opencl: flattening quantized weights representation as struct of arrays (GGML_OPENCL_SOA_Q)
# ggml_opencl: using kernels optimized for Adreno (GGML_OPENCL_USE_ADRENO_KERNELS)
# ggml_opencl: loading OpenCL kernels...............................................................
# ggml_opencl: default device: 'QUALCOMM Adreno(TM) (OpenCL 3.0 Adreno(TM) 730)'
# Available devices:
#   Vulkan0: Turnip Adreno (TM) 725 (8438 MiB, 4984 MiB free)
#   GPUOpenCL: QUALCOMM Adreno(TM) (0 MiB, 0 MiB free)
