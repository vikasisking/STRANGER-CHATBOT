FROM ubuntu:22.04

# Install python, node, ffmpeg, curl, wget
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python3 python3-pip \
       nodejs npm \
       ffmpeg \
       curl wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD ["bash", "start"]
