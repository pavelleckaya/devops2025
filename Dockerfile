FROM alpine:latest AS builder
RUN apk add --no-cache g++ && rm -rf /var/cache/apk/*
WORKDIR /app
COPY ./main.cpp .
RUN g++ -std=c++17 ./main.cpp -o cpp_app

FROM alpine:latest
RUN adduser -D appuser
RUN apk add --no-cache libstdc++ && rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=builder /app/cpp_app .
RUN chown appuser /app/cpp_app
USER appuser
ENV APP_ENV="Hi! It is Dockerfile lab 3"
CMD ["./cpp_app"]