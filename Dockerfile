FROM alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY _build/prod/rel/glitchr .

CMD ./bin/glitchr foreground
