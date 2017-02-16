#!/bin/bash

set -e

./node_modules/brunch/bin/brunch b -p
MIX_ENV=prod mix do phoenix.digest, release --env=prod

# Dockerise
mix docker build

# Exit successfully
exit 0
