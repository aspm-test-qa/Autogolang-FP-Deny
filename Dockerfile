# Intentionally vulnerable image for testing Trivy & Grype
FROM debian:stretch

LABEL maintainer="security-lab@example.com"
LABEL purpose="Intentional Vulnerability Test Image"

# Non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install outdated, known-vulnerable packages
RUN apt-get update && \
    apt-get install -y \
        openssl=1.1.0l-1~deb9u6 \
        libssl1.1 \
        python2.7 \
        curl \
        wget \
        vim && \
    rm -rf /var/lib/apt/lists/*

# Add a dummy app script
COPY app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh

CMD ["/usr/local/bin/app.sh"]
