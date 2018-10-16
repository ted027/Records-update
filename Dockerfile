ARG NODE_VERSION=9.7.1
FROM node:$NODE_VERSION
MAINTAINER ted027

RUN set -ex && \
    echo 'deb http://ftp.jp.debian.org/debian testing main' >> /etc/apt/sources.list && \
    echo 'APT::Default-Release "stable";' >> /etc/apt/apt.conf.d/00local
    
RUN set -ex && \
    apt-get update && \
    apt-get install -y python3-pip && \
    apt-get -t testing install python3.6 && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    rm -f /usr/bin/python && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip install awscli

COPY entrypoint.sh /var/tmp
RUN chmod 755 /var/tmp/entrypoint.sh

CMD ["var/tmp/entrypoint.sh"]
