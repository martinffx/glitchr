#!/bin/bash

# http://code.parent.co/phoenix-circleci-heroku/
# Ensure exit codes other than 0 fail the build
set -e

# Check for asdf
if ! asdf | grep version;
then
    git clone https://github.com/HashNuke/asdf.git ~/.asdf;

    # Add plugins for asdf
    asdf plugin-add erlang https://github.com/HashNuke/asdf-erlang.git
    asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git
fi

# Install erlang/elixir
erlang_version=$(awk '/erlang/ { print $2 }' .tool-versions)
asdf install erlang $erlang_version
elixir_version=$(awk '/elixir/ { print $2 }' .tool-versions)
asdf install elixir $elixir_version

# Compile
yes | mix deps.get
yes | mix compile

# Build
npm install
./node_modules/brunch/bin/brunch b -p && MIX_ENV=prod mix do phoenix.digest, release --env=prod

# Dockerise
docker build -t martinffx/glitchr .

# Exit successfully
exit 0
