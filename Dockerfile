FROM node:8-alpine

LABEL h265ize_version="bleading edge" architecture="amd64"

RUN apk add --no-cache --update-cache git ffmpeg && \
    npm install FallingSnow/h265ize --global --no-optional && \
    apk del git && \
    mkdir /input && mkdir /output && \
    rm /var/cache/apk/*

VOLUME ["/input", "/output"]
WORKDIR /h265ize

ENTRYPOINT ["/usr/local/bin/h265ize", "--watch", "/input", "-d", "/output"]