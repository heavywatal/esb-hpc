.DEFAULT_GOAL := all
.PHONY := all clean hugo-public hugo-private server watch

all: hugo-public hugo-private
	@:

hugo-public: | public
	hugo --destination=public

hugo-private: |
	hugo -D

public:
	$(eval REMOTE_URL := $(shell git remote get-url origin))
	git clone -b $@ --single-branch ${REMOTE_URL} $@

server:
	hugo -Dw server

watch:
	hugo -Dw

clean:
	ls -d private/* public/* | grep -Ev '.git' | xargs rm -r
