.PHONY: private public

all: private public
	@:

private:
	hugo -D

public:
	hugo --destination=public

start:
	hugo -Dw

clean:
	ls -d private/* public/* | grep -Ev '.git' | xargs rm -r
