ARG PYTHON_VERSION=3.6
FROM python:$PYTHON_VERSION
MAINTAINER ted027

RUN set -ex \
    && pip install awscli

ARG NODE_VERSION=8.9.1
RUN set -ex \
    && mkdir -p /opt/node \
    && wget -q -O /opt/node/node-linux-x64.tar.gz https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz \
    && tar --strip-components 1 -xzf /opt/node/node-linux-x64.tar.gz -C /opt/node \
    && rm /opt/node/node-linux-x64.tar.gz \
    && echo "export PATH=/opt/node/bin:$PATH" >> /etc/bashrc

COPY entrypoint.sh /var/tmp
RUN chmod 755 /var/tmp/entrypoint.sh

CMD ["/var/tmp/entrypoint.sh"]
