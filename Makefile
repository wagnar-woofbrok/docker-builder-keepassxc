
build:
	docker build -t keepassxc .

.PHONY: build

run:
	docker run --rm -it -v ${PWD}:/code keepassxc
# docker run -v /Users/bmalone/Projects/build_keepassxc/dist:/code/build -d keepassxc

.PHONY: run

echo:
	echo ${PWD}

.PHONY: echo
