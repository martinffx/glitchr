FROM elixir:1.4-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql-client

COPY _build/prod/rel/glitchr .

CMD ./bin/glitchr foreground
