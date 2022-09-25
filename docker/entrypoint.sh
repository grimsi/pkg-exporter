#!/bin/sh

# Append all environment variables to /etc/environment
env >> /etc/environment

# Replace the content of the crontab file
echo "${SCHEDULE} root /usr/local/bin/pkg-exporter >/proc/1/fd/1 2>/proc/1/fd/2" > /etc/crontab

# execute CMD
echo "Running pkg_exporter with schedule ${SCHEDULE}"
exec "$@"
