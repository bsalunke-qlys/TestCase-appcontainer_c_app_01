FROM gcc:6 AS build-env
ADD . /app
ADD ./docker-17.09.0-ce.tar.gz /usr/local/bin/
WORKDIR /app
RUN cc hello.c -o hello

FROM gcr.io/distroless/cc
ADD ./docker-17.09.0-ce.tar.gz /usr/local/bin/
ADD ./var.tar /
COPY --from=build-env /app /app
WORKDIR /app
CMD ["./hello"]
