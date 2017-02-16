FROM elixir:1.4-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY _build/prod/rel/glitchr .

CMD ./bin/glitchr foreground
