FROM alpine/node
MAINTAINER ted027

RUN set -ex && \
    apk update && \
    apk --update add git && \
    apk --update add python3 && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    ln -s /usr/bin/python3.6 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip install awscli

COPY entrypoint.sh /var/tmp
CMD ["var/tmp/entrypoint.sh"]
