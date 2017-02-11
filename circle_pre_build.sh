#!/bin/bash

# http://code.parent.co/phoenix-circleci-heroku/
# Ensure exit codes other than 0 fail the build
set -e

# Check for asdf
if ! asdf | grep version; then
    git clone https://github.com/HashNuke/asdf.git ~/.asdf;

    # Add plugins for asdf
    asdf plugin-add erlang https://github.com/HashNuke/asdf-erlang.git
    asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git
fi

# Install erlang/elixir
asdf install erlang
asdf install elixir

# Get dependencies
yes | mix deps.get
mix local.rebar

# Exit successfully
exit 0
