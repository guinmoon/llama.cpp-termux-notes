HIPCXX="$(hipconfig -l)/clang" HIP_PATH="$(hipconfig -R)" cmake -S . -B build_vulkan_rocwmma_openblas -DGGML_VULKAN=ON -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DBUILD_SHARED_LIBS=OFF -DGGML_HIP=ON -DGGML_HIP_ROCWMMA_FATTN=ON -DAMDGPU_TARGETS="gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102;gfx1200;gfx1201" -DCMAKE_BUILD_TYPE=Release && cmake --build build_vulkan_rocwmma_openblas --config Release -- -j 7


source /opt/aocl/aocc/amd-libs.cfg

HIPCXX="$(hipconfig -l)/clang" HIP_PATH="$(hipconfig -R)" cmake -S . -B build_rocwmma_aocl -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=AOCL -DBUILD_SHARED_LIBS=OFF -DGGML_HIP=ON -DGGML_HIP_ROCWMMA_FATTN=ON -DAMDGPU_TARGETS="gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102;gfx1200;gfx1201" -DCMAKE_BUILD_TYPE=Release -DBLAS_INCLUDE_DIRS=/opt/aocl/gcc/include && cmake --build build_rocwmma_aocl --config Release -- -j 7
# -DCMAKE_C_COMPILER=/opt/rocm/bin/amdclang -DCMAKE_CXX_COMPILER=/opt/rocm/bin/amdclang++ -DCMAKE_CXX_FLAGS=-I/opt/rocm/include


# if(GGML_HIP_ROCWMMA_FATTN)
#     if(EXISTS "/opt/rocm/include/rocwmma/rocwmma.hpp")
#         set(FOUND_ROCWMMA TRUE)
#         include_directories(/opt/rocm-6.4.1/include)
#     else()
#         message(FATAL_ERROR "rocwmma.hpp not found at /opt/rocm-6.4.1/include/rocwmma/rocwmma.hpp")
#     endif()
#  endif()