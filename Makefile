TAG = 1.1
PREFIX = antob/nginx-base

all: build push

build:
	docker build -t $(PREFIX):$(TAG) .

push:
	docker push $(PREFIX):$(TAG)
