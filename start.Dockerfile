FROM alpine:latest
RUN adduser -D appuser
RUN apk add --no-cache libstdc++ && rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=build_docker /app/cpp_app .
RUN chown appuser /app/cpp_app
USER appuser
ENV APP_ENV="Hi! It is Dockerfile lab 4"
CMD ["./cpp_app"]