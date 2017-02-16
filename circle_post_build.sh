#!/bin/bash

set -e

npm install
./node_modules/brunch/bin/brunch b -p && MIX_ENV=prod mix do phoenix.digest, release --env=prod

# Dockerise
docker build -t martinffx/glitchr .

# Exit successfully
exit 0
