FROM python:3.12-slim-bookworm

WORKDIR /opt/duckduckgo-mcp-server

COPY duckduckgo-mcp-server /opt/duckduckgo-mcp-server

RUN python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir ".[browser]"

ENV DDG_SAFE_SEARCH=OFF
ENV DDG_REGION=jp-ja
ENV DDG_SEARCH_RPM=30

CMD [ \
    "duckduckgo-mcp-server", \
    "--transport", "streamable-http", \
    "--fetch-backend", "curl", \
    "--host", "0.0.0.0", "--port", "7070" \
]
