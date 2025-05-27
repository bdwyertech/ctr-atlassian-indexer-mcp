FROM python:3.13-slim

RUN apt-get update && \
    apt-get install -y build-essential llvm-15 llvm-15-dev git && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip uv

RUN git clone https://github.com/shnax0210/documents-vector-search /opt/indexer

WORKDIR /indexer
# Install project dependencies
RUN uv sync

CMD ["bash"]
