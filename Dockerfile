FROM golang:1.16.14-buster as builder
COPY go.* /app/
COPY main.go /app/
COPY Makefile /app/
COPY VERSION /app/
WORKDIR /app
RUN make build

FROM quay.io/prometheus/busybox:latest

COPY --from=builder /app/prometheus-example-app /bin/prometheus-example-app

ENTRYPOINT ["/bin/prometheus-example-app"]
