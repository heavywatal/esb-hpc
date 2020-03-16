.DEFAULT_GOAL := all
.PHONY := all clean hugo-public hugo-private server watch

all: hugo-public hugo-private
	@:

hugo-public: | public
	hugo --environment production

hugo-private: | private
	hugo --environment development

private:
	mkdir ../heavywatal.github.io/public/hpc-esb
	ln -s ../heavywatal.github.io/public/hpc-esb private

public:
	$(eval REMOTE_URL := $(shell git remote get-url origin))
	git clone -b $@ --single-branch ${REMOTE_URL} $@

server:
	hugo --environment development -w server

watch:
	hugo --environment development -w

clean:
	ls -d private/* public/* | grep -Ev '.git' | xargs rm -r
