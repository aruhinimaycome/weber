FROM ubuntu:latest
LABEL maintainer="Docker Education Team <education@docker.com>"

# Install python in single layer - better caching
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/webapp

# Copy requirements first - cached unless requirements change
COPY ./webapp/requirements.txt .
RUN pip3 install -qr requirements.txt

# Copy app code last - cache busts only when code changes
COPY ./webapp .

EXPOSE 5000
CMD ["python3", "app.py"]
