.PHONY: help install dependencies build deploy clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	node_modules

dependencies:
	type npm > /dev/null
	type npx > /dev/null

node_modules:
	npm install

build:
	npx --no-install gatsby build --prefix-paths

deploy: build
	npx --no-install gh-pages -d public -b gh-pages

clean:
	rm -rf public
	rm -rf .cache
	rm -rf node_modules
