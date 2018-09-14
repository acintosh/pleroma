version: '3'
services:
  app:
    build: .
    image: pleroma
    restart: always
    environment:
      - MIX_ENV=dev
    command: mix phx.server
    volumes:
      - ./uploads:/pleroma/uploads
      - ./config:/pleroma/config
      - ./priv:/pleroma/priv
