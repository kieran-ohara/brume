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

linux-marvell.zip:
	curl -SL https://github.com/MarvellEmbeddedProcessors/linux-marvell/archive/refs/heads/linux-4.14.76-armada-18.12.zip -o $@

linux-marvell-linux-4.14.76-armada-18.12: linux-marvell.zip
	unzip $<

linux-marvell/arch/arm64/boot/Image: linux-marvell-linux-4.14.76-armada-18.12 Dockerfile.tar env-file.txt
	docker run --rm --env-file env-file.txt  -v $(PWD)/$<:/build -w /build cross-compile
