# Still intentionally vulnerable
FROM ubuntu:20.04

LABEL maintainer="security-test@example.com"
LABEL purpose="Vulnerability scan demo (Trivy / Grype)"

# Set non-interactive frontend to avoid tzdata prompts
ENV DEBIAN_FRONTEND=noninteractive

# Use outdated packages known to have CVEs
RUN apt-get update && \
    apt-get install -y \
        python2-minimal \
        openssl \
        curl \
        wget \
        vim && \
    rm -rf /var/lib/apt/lists/*

# Add dummy app
COPY app.sh /usr/local/bin/app.sh
RUN chmod +x /usr/local/bin/app.sh

CMD ["/usr/local/bin/app.sh"]

