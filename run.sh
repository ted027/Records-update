#!/bin/bash

docker build -f ./Dockerfile -t records-update .
docker run -v ~/.aws:/root/.aws records-update