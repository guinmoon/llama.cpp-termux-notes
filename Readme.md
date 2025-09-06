# Build and run llama.cpp in Termux

echo "Updating package list and upgrading installed packages"
apt update && apt upgrade -y

echo "Installing required dependencies: clang, wget, just, python, cmake, libcurl, git, screen, proot-distro, nodejs-lTS"
apt install clang wget just python cmake libcurl git screen proot-distro nodejs-lts -y
apt install perl libopenblas shaderc opencl-headers mesa-vulkan-icd-freedreno llama-cpp-backend-vulkan -y # blas,vk,mopencl

echo "Changing directory to llama.cpp"
cd llama.cpp

echo "Building llama.cpp with CPU-specific configurations"
cmake -B build_cpu  -DGGML_NATIVE=ON  -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas

# cmake -B build_blis -DGGML_NATIVE=ON  -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=FLAME -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/

# cmake -B build_kle -DGGML_CPU_KLEIDIAI=ON -DGGML_NATIVE=ON -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF

# cmake -B build_vk -DGGML_VULKAN=ON -DGGML_NATIVE=ON -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS=-I/data/data/com.termux/files/usr/include/openblas;/data/data/com.termux/files/usr/include/vulkan

# cmake -B build_opencl_keidi -DGGML_OPENCL=ON -DGGML_NATIVE=ON -DGGML_CPU_KLEIDIAI=ON -DCMAKE_C_COMPILER=/data/data/com.termux/files/usr/bin/clang -DCMAKE_CXX_COMPILER=/data/data/com.termux/files/usr/bin/clang++ -DBUILD_SHARED_LIBS=OFF -DGGML_OPENCL_USE_ADRENO_KERNELS=ON 
# LD_LIBRARY_PATH=./:$PREFIX/lib 
# cp /vendor/lib64/libOpenCL.so .