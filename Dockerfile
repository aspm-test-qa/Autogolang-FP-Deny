# Intentionally vulnerable image for security scanner testing
FROM python:3.6-slim

LABEL maintainer="security-lab@example.com"
LABEL purpose="Trivy & Grype Vulnerability Testing"

# Install outdated/vulnerable packages
RUN apt-get update && \
    apt-get install -y \
        openssl \
        curl \
        wget \
        vim && \
    pip install --no-cache-dir flask==1.0.2 requests==2.18.4 && \
    rm -rf /var/lib/apt/lists/*

# Add simple app
COPY app.py /usr/src/app/app.py
WORKDIR /usr/src/app

CMD ["python", "app.py"]
