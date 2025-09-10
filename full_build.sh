#!/bin/bash
echo "Cloning repo and llama.cpp"
git clone --recurse-submodules https://github.com/guinmoon/llama.cpp-termux-notes
cd llama.cpp-termux-notes
./install_req.sh
cd llama.cpp
./build_CPU.sh
./build_OpenBLAS.sh
./build_OpenBLIS.sh
./build_KleidiAI.sh
./build_OpenCL.sh
./build_Vulkan.sh
./build_Vulkan_OpenCL.sh