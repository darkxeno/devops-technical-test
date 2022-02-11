#!/bin/bash
set -e

docker build . -t cft-nginx

docker run -d -p 3000:80 cft-nginx:latest

echo "Open http://localhost:3000 on your web browser"