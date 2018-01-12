FROM elixir:1.5.3

LABEL maintainer="dot.kadza@gmail.com"
LABEL version="1.3.0"


ENV DEBIAN_FRONTEND=noninteractive
ENV NODE_VERSION_MAJOR=9

RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez \
    && mix local.hex --force \
    && mix local.rebar --force


RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION_MAJOR}.x | bash -

RUN apt-get update \ 
    && apt-get install -y -q \ 
    nodejs \
    inotify-tools \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app