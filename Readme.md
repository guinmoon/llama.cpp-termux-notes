# Build and run llama.cpp in Termux

## Overview

This project provides instructions and scripts for building and running [llama.cpp](https://github.com/ggerganov/llama.cpp) in the Termux environment on Android.  It explores various acceleration methods, including BLAS, OpenCL, and Vulkan, to maximize performance on Android devices. This guide details the build process, benchmarking, and provides insights into the challenges of achieving optimal LLM inference speed on Android compared to iOS.

## Quick Start

```bash
bash <(curl -s https://raw.githubusercontent.com/guinmoon/llama.cpp-termux-notes/refs/heads/main/common_build.sh)
```

This script automates the build process with various settings.  It will download dependencies, compile llama.cpp, and configure it for the best available acceleration on your device.

## Motivation

[llama.cpp](https://github.com/ggml-org/llama.cpp) is a powerful project for running Large Language Models (LLMs) locally on a wide variety of hardware. It supports numerous BLAS (Basic Linear Algebra Subprograms) libraries and GPU acceleration frameworks.

The speed of LLM inference relies heavily on efficient numerical computation.  The acceleration options in llama.cpp fall into two main categories:

*   **CPU BLAS:** These libraries optimize fundamental linear algebra operations (vector and matrix calculations).
*   **GPU Acceleration:** Utilizing the GPU's parallel processing capabilities for faster matrix multiplications and other computationally intensive tasks.

On iOS, frameworks like Accelerate (for BLAS) and Metal (for GPU) provide highly optimized performance. This combination allows for excellent inference speeds, even on older devices like the iPhone 12 Pro Max.  However, Android currently lacks a comparable unified system like Accelerate/Metal.

While Android devices often boast ample RAM (12GB or 16GB are becoming common),  achieving the same level of LLM performance as iOS is challenging. Modern Snapdragon processors are beginning to include Arm instructions like SVE, SVE2, and SME, but these are not yet universally available.

At present, Android users can leverage OpenCL and Vulkan for GPU acceleration, alongside BLAS implementations like OpenBLAS, BLIS, and optimized kernels from KleidiAI.  This guide benchmarks these options to determine the best performance on mid-range Android hardware.

## Benchmarking

### Common Benchmark Suite

```bash
cd ~/llama.cpp-termux-notes/bench
#./bench_all.sh <model>
./bench_common.sh ~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf
```

This command runs a comprehensive benchmark comparing different acceleration backends using a specified model.  Replace `~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf` with the path to your GGUF model file.

### Full Benchmark Suite

```bash
cd ~/llama.cpp-termux-notes/bench
#./bench_all.sh <model>
./bench_all.sh ~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf
```

This command runs a comprehensive benchmark comparing different acceleration backends using a specified model.  Replace `~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf` with the path to your GGUF model file.

### Single Variant Benchmark

```bash
cd ~/llama.cpp-termux-notes/bench
#./bench.sh <model_path> <benchmark_type>
./bench.sh ~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf opencl
```

This allows you to benchmark a specific model with a particular acceleration backend. Replace `<model_path>` with the path to your model file and `<benchmark_type>` with the desired backend (e.g., `opencl`, `vulkan`, `blas`).

### Tested Hardware
This setup was tested on:

*   **Device:** Samsung Galaxy Z Fold 4
*   **Processor:** Snapdragon 8+ Gen 1 (Octa-core: 1x 3.19 GHz Cortex-X2, 3x 2.75 GHz Cortex-A710, 4x 1.80 GHz Cortex-A510)
*   **GPU:** Adreno 730
*   **RAM:** 12GB

## Considerations and Troubleshooting

*   **Model Placement:**  Storing your models in the `/sdcard/downloads` or a similar external storage location is recommended due to space limitations in the Termux home directory.
*   **Memory Usage:** LLMs can consume significant memory. Ensure you have enough free RAM and swap space configured in Termux for optimal performance.
*   **OpenCL/Vulkan Drivers:**  Ensure your device has compatible OpenCL and/or Vulkan drivers installed. These are typically included with the GPU drivers.
*   **Performance Variability:** Performance can vary significantly depending on the model, the chosen backend, and the specific device.
* **iOS comparison**: Even with 6GB of RAM (with only 3GB available due to OS overhead), iPhones often achieve faster inference speeds than comparable Android devices. This is attributed to the optimized Accelerate/Metal framework.

## Further Research

This project serves as a starting point for exploring LLM inference on Android.  
