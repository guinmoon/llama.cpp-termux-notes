  
taskset -c 0,1,2,3 /data/data/com.termux/files/home/llama.cpp-termux-notes/llama.cpp/build_vk/bin/llama-bench -m ~/storage/downloads/gemma-3-1b-it-q4_0-pure.gguf  -t 1 -ctk q8_0 -ctv q8_0 -fa 1 -ngl 99 > ./run_vulkan0123.txt



