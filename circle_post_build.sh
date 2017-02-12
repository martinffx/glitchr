#!/bin/bash

set -e

ls
npm install
ls node_modules
./node_modules/brunch/bin/brunch b -p && MIX_ENV=prod mix do phoenix.digest, release --env=prod

# Dockerise
docker build -t martinffx/glitchr .

# Exit successfully
exit 0
