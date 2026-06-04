#!/bin/sh
# Speedtest Tracker Add-on startup script

set -e

# Get configuration from Home Assistant add-on options
APP_PORT=${1:-8000}
APP_KEY_LENGTH=${2:-32}
LOG_LEVEL=${3:-info}

echo "[INFO] Starting Speedtest Tracker..."
echo "[INFO] App Port: $APP_PORT"
echo "[INFO] Log Level: $LOG_LEVEL"

# Set environment variables
export PORT=$APP_PORT
export APP_KEY_LENGTH=$APP_KEY_LENGTH
export LOG_LEVEL=$LOG_LEVEL

# Start PHP-FPM and nginx (as per linuxserver/speedtest-tracker image)
exec /init
