FROM alpine/node
MAINTAINER ted027

RUN set -ex && \
    apk update && \
    apk --update add git && \
    apk --update add python3 && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    ln -s /usr/bin/python3.6 /usr/bin/python && \
    ln -s /usr/bin/pip3.6 /usr/bin/pip3
    # pip install awscli

RUN set -ex && \
    git clone https://github.com/ted027/Records-web.git && \
    pip install -e Records-web/commands && \
    records-dev update records && \
    cd Records-web/webui && npm install && npm run build && \
    aws s3 sync ./build s3://records-web-hogeeee/ && \
    cd -