#!/bin/bash

docker run \
    --rm \
    -d \
    -e DDG_ALLOW_PRIVATE_URLS=1 \
    --cpus "$(nproc)" \
    -p 7070:7070 \
    --name ddg-server \
    mynah/ddg-server \
