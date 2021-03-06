FROM elixir:1.4-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql-client wget tar

RUN wget https://github.com/jwilder/dockerize/releases/download/v0.3.0/dockerize-linux-amd64-v0.3.0.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.3.0.tar.gz

ADD ./nginx.conf.sigil ./
COPY ./_build/prod/rel/glitchr .

COPY ./start.sh start.sh
RUN chmod +x ./start.sh

CMD ./start.sh
