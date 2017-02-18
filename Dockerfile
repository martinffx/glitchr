FROM elixir:1.4-slim

ENV DOCKERIZE_VERSION v0.2.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql-client

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY _build/prod/rel/glitchr .

CMD dockerize -wait tcp://db:5432 ./bin/glitchr foreground
