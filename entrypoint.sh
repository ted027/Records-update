#!/bin/sh

git clone https://github.com/ted027/Records-web.git
pip3 install -e Records-web/commands
records-dev update records

cd Records-web/webui
npm install
npm run build
cd -

aws s3 sync ./webui//build s3://records-web-hogeeee/