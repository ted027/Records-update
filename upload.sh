#!/bin/sh

docker build -f ./Dockerfile -t records-update .
docker save records-update > records-update.tar.gz
zip -9q records-update.zip records-update.tar.gz
# aws s3 cp ./records-update.zip s3://TODO