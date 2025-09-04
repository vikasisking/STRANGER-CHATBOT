FROM ubuntu:22.04

# Install Python, Node, ffmpeg, and required build tools for tgcrypto
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip python3-dev \
    nodejs npm \
    ffmpeg wget curl \
    build-essential libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Upgrade pip & install dependencies
RUN pip3 install --no-cache-dir -U pip setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "start"]
