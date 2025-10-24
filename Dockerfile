# Intentionally vulnerable image for testing Trivy & Grype
FROM debian:stretch

LABEL maintainer="security-lab@example.com"
LABEL purpose="Intentional Vulnerability Test Image"

# Use archived Debian Stretch sources (EOL, but still downloadable)
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid && \
    apt-get update && \
    apt-get install -y \
        openssl \
        python2.7 \
        curl \
        wget \
        vim && \
    rm -rf /var/lib/apt/lists/*

# Add a dummy script
COPY app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh

CMD ["/usr/local/bin/app.sh"]
