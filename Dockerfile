#FROM joakimk/rpi-elixir
FROM elixir:1.7-alpine

LABEL maintainer "acintosh <https://github.com/acintosh>"

WORKDIR /pleroma

RUN apk -U upgrade \
    && apk add -t build-dependencies \
       build-base \
    && apk add git \
    && rm -rf /tmp/* /var/cache/apk/* \
    && mkdir /pleroma/uploads

COPY ./pleroma /pleroma

ENV MIX_ENV dev

RUN cd /pleroma \
    && mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get

VOLUME ["/pleroma/uploads", "/pleroma/config", "/pleroma/priv"]
