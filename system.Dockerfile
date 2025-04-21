FROM alpine:latest AS builder
RUN apk add --no-cache g++ && rm -rf /var/cache/apk/*
WORKDIR /app