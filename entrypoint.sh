#!/bin/bash

source /etc/bashrc

git clone https://github.com/ted027/Records-web.git
pip install -e Records-web/commands
records-dev update records

cd Records-web/webui
npm install
npm run build

aws s3 sync ./build s3://records-web-hogeeee/