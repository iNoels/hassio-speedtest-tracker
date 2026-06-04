# Allow overriding the base image via build-arg for pinned digests
# Default to lscr.io (LinuxServer registry) instead of Docker Hub
ARG BASE_IMAGE=lscr.io/linuxserver/speedtest-tracker:latest
FROM ${BASE_IMAGE}

# Copy custom startup script
COPY rootfs/usr/local/bin/start_speedtest_tracker.sh /usr/local/bin/start_speedtest_tracker.sh
RUN chmod +x /usr/local/bin/start_speedtest_tracker.sh

# Copy s6-overlay configuration
COPY rootfs/etc/services.d/speedtest-tracker /etc/services.d/speedtest-tracker

# Create necessary directories
RUN mkdir -p /config/speedtest-tracker && \
    mkdir -p /tmp && \
    chmod -R 777 /tmp

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
    CMD curl --fail http://localhost:8000/api/health || exit 1

EXPOSE 8000
