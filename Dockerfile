ARG PYTHON_VERSION=3.6
FROM python:$PYTHON_VERSION
MAINTAINER ted027

RUN set -ex && \
    apt update && apt-get install -y \
    nodejs \
    npm && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    pip install awscli

COPY entrypoint.sh /var/tmp
RUN chmod 755 /var/tmp/entrypoint.sh

CMD ["var/tmp/entrypoint.sh"]
