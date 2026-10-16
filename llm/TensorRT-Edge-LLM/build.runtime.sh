#!/bin/bash

if [ ! -d tensorrt-edge-llm ]; then
    git clone -b release/0.11.0 https://github.com/NVIDIA/TensorRT-Edge-LLM
    cd TensorRT-Edge-LLM
    git submodule update --init --recursive
    
    cd ..
fi

docker build . -f Dockerfile.runtime --tag mynah/tensorrt-edge-llm
