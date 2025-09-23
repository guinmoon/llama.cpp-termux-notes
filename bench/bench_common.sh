#!/bin/bash

MODEL="$1" 

./bench.sh $MODEL cpu
sleep 120
./bench.sh $MODEL kleidi
sleep 120
./bench.sh $MODEL opencl_openblas
sleep 120
./bench.sh $MODEL vk_openblas