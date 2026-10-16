#!/bin/bash

if [ ! -d llama.cpp ]; then
    git clone -b v0.7.0 https://github.com/ggml-org/llama.cpp
fi

docker build . -f Dockerfile.togguf --tag mynah/llama-gguf-converter
