TAG = 1.2-http
PREFIX = antob/nginx-base

all: build push

build:
	docker build -t $(PREFIX):$(TAG) .

push:
	docker push $(PREFIX):$(TAG)
