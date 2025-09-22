#!/bin/bash
echo "Cloning repo and llama.cpp"
apt update && apt install -y git 
git clone --recurse-submodules https://github.com/guinmoon/llama.cpp-termux-notes
cd llama.cpp-termux-notes
chmod +x *.sh
chmod +x ./build/*.sh
chmod +x ./bench/*.sh
./install_req.sh
cd llama.cpp
../build/build_CPU.sh
../build/build_OpenBLAS.sh
../build/build_BLIS.sh
../build/build_KleidiAI.sh
../build/build_OpenBLAS_Kle.sh
../build/build_OpenCL.sh
../build/build_Vulkan_OpenBLAS.sh
../build/build_Vulkan_OpenCL.sh
../build/build_Vulkan_OpenCL_OpenBLAS.sh