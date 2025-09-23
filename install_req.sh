#!/bin/bash


echo "Updating package list and upgrading installed packages"
apt update && apt upgrade -y

echo "Installing required dependencies: clang, wget, just, python, cmake, libcurl, git, screen, proot-distro, nodejs-lTS"
apt install clang wget just python cmake libcurl git screen  -y
apt install perl libopenblas shaderc opencl-headers mesa-vulkan-icd-freedreno llama-cpp-backend-vulkan -y # blas,vk,mopencl





