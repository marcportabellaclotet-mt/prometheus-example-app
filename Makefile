VERSION:=$(shell cat VERSION)

LDFLAGS="-X main.appVersion=$(VERSION)"

build:
	CGO_ENABLED=0 go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go

all:
	CGO_ENABLED=0 go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go
	docker build -t marcportabellaclotet/prometheus-example-app:$(VERSION) .
