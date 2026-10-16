#!/bin/bash


VERSION=v0.7.0

if [ ! -d duckduckgo-mcp-server ]; then
	git clone -b $VERSION https://github.com/nickclyde/duckduckgo-mcp-server
fi

docker build . -f Dockerfile --tag mynah/ddg-server
