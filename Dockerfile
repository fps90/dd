FROM ubuntu:jammy

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y git libxrender1 python3-pip ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "-m", "AdityaHalder"]
