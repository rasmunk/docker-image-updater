FROM golang:1.10.3-alpine

RUN apk add tzdata git dep

WORKDIR /go/src/docker-image-updater
COPY . .

RUN dep ensure
RUN go build ./...
RUN go install -v ./...

ENTRYPOINT ["/go/bin/docker-image-updater"]
CMD ["-update", "debian:latest", "-interval", "10"]