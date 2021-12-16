# Get the Kernel source.
mv1000-ubuntu-kernel-master.zip:
	curl -SL https://github.com/gl-inet/mv1000-ubuntu-kernel/archive/refs/heads/master.zip -o $@
linux-marvell-linux-4.14.76-armada-18.12.zip:
	curl -SL https://github.com/MarvellEmbeddedProcessors/linux-marvell/archive/refs/heads/linux-4.14.76-armada-18.12.zip -o $@

# Create environment for building Kernels.
Dockerfile.tar: Dockerfile entrypoint.sh
	docker build -t cross-compile .
	touch $@

env-file.txt:
	touch $@

# Build the Kernel source code.
.PRECIOUS: %.unzip
%.unzip: %.zip
	mkdir $@
	tar --strip-components=1 -xvf $< -C $@
%/arch/arm64/boot/Image %/arch/arm64/modules &: % Dockerfile.tar env-file.txt
	docker run --rm --env-file env-file.txt  -v $(CURDIR)/$<:/build -w /build cross-compile
	touch $*/arch/arm64/boot/Image
	touch $*/arch/arm64/modules
