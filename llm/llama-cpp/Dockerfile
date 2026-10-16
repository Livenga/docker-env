#
# llama.cpp v0.6.0
#


# ビルド環境
FROM nvcr.io/nvidia/cuda:13.2.1-devel-ubuntu24.04 AS builder

COPY llama.cpp /app/llama.cpp

WORKDIR /app/llama.cpp

RUN apt update && \
        apt install -y cmake ccache build-essential cmake curl

RUN cmake -B build \
        -DGGML_CUDA=ON \
        -DGGML_NATIVE=ON \
        -DCMAKE_CUDA_ARCHITECTURES="100" \
        -DCMAKE_LIBRARY_PATH="/usr/local/cuda/compat" && \
    cmake --build build --config Release -j $(nproc)



# 実行環境
FROM nvcr.io/nvidia/cuda:13.2.1-runtime-ubuntu24.04

COPY --from=builder /app/llama.cpp/build/bin /opt/llama.cpp

WORKDIR /app

RUN groupadd -g 993 render
RUN apt update && apt install -y libgomp1

ENV LD_LIBRARY_PATH=/opt/nvidia/l4t-gpu-libs/openrm:/opt/llama.cpp:$LD_LIBRARY_PATH
ENV PATH=$PATH:/opt/llama.cpp


ENTRYPOINT [ "llama-server" ]
