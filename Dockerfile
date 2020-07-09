FROM gcc:6 AS build-env
ADD . /app
WORKDIR /app
RUN cc hello.c -o hello

FROM gcr.io/distroless/cc
ADD ./docker /usr/local/bin/
ADD ./var.tar /
COPY --from=build-env /app /app
WORKDIR /app
ENTRYPOINT ["./hello"]
