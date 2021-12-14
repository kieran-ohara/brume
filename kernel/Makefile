Dockerfile.tar: Dockerfile entrypoint.sh
	docker build -t cross-compile .
	docker save cross-compile > $@

kernel.zip:
	curl -SL https://github.com/gl-inet/mv1000-ubuntu-kernel/archive/refs/heads/master.zip -o $@

mv1000-ubuntu-kernel-master: kernel.zip
	unzip $<

env-file.txt:
	touch $@

mv1000-ubuntu-kernel-master/arch/arm64/boot/Image: mv1000-ubuntu-kernel-master Dockerfile.tar env-file.txt
	docker run --rm --env-file env-file.txt  -v $(PWD)/$<:/build -w /build cross-compile
