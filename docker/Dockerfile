FROM python:slim-bullseye

RUN apt-get update &&  \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      git \
      cron \
      python3-apt \
    && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /etc/cron.*/*

RUN pip3 install git+https://github.com/margau/pkg-exporter

COPY docker/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Run crond in foreground and with log level 2
CMD ["cron", "-f", "-L", "2"]
