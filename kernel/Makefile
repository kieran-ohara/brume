Dockerfile.tar: Dockerfile entrypoint.sh
	docker build -t cross-compile .
	touch $@

env-file.txt:
	touch $@

LGL:=mv1000-ubuntu-kernel-master
$(LGL).zip:
	curl -SL https://github.com/gl-inet/mv1000-ubuntu-kernel/archive/refs/heads/master.zip -o $@
$(LGL): $(LGL).zip
	unzip $<

LMV:=linux-marvell-linux-4.14.76-armada-18.12
$(LMV).zip:
	curl -SL https://github.com/MarvellEmbeddedProcessors/linux-marvell/archive/refs/heads/linux-4.14.76-armada-18.12.zip -o $@
$(LMV): $(LMV).zip
	unzip $<

%/arch/arm64/boot/Image %/arch/arm64/modules &: % Dockerfile.tar env-file.txt
	docker run --rm --env-file env-file.txt  -v $(CURDIR)/$<:/build -w /build cross-compile
	touch $*/arch/arm64/boot/Image
	touch $*/arch/arm64/modules
