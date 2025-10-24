# Intentionally vulnerable Dockerfile for testing Trivy / Grype
FROM ubuntu:18.04

LABEL maintainer="security-lab@example.com"
LABEL purpose="Intentional Vulnerability Test Image"

ENV DEBIAN_FRONTEND=noninteractive

# Install old, known-vulnerable packages
RUN apt-get update && \
    apt-get install -y \
        python2.7 \
        openssl \
        curl \
        wget \
        vim && \
    rm -rf /var/lib/apt/lists/*

# Add a simple app
COPY app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh

CMD ["/usr/local/bin/app.sh"]
