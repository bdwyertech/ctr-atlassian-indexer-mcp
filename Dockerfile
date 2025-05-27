FROM python:3.13-slim

RUN apt-get update && \
    apt-get install -y build-essential git && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip uv

RUN git clone https://github.com/shnax0210/documents-vector-search /opt/indexer

WORKDIR /opt/indexer
# Install project dependencies
RUN uv sync
RUN uv run python -c "from sentence_transformers import SentenceTransformer; SentenceTransformer('sentence-transformers/all-MiniLM-L6-v2')"

CMD ["bash"]
