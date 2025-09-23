#!/bin/bash

MODEL="$1" 

./bench.sh $MODEL cpu
sleep 120
./bench.sh $MODEL openblas
sleep 120
./bench.sh $MODEL kleidi
sleep 120
./bench.sh $MODEL blis
sleep 120
./bench.sh $MODEL openblas_kle
sleep 120
./bench.sh $MODEL opencl
sleep 120
./bench.sh $MODEL vk