ubuntu/ubuntu-18.04.3-20200109:
	make -C $(@D) $(@F)

ubuntu/newbuntu: ubuntu/ubuntu-18.04.3-20200109
	cp -a $< $@

MV1000_KERNEL:=mv1000-ubuntu-kernel-master.unzip/arch/arm64
kernel/$(MV1000_KERNEL)/boot/Image kernel/$(MV1000_KERNEL)/modules &:
	make -C kernel $(MV1000_KERNEL)/boot/Image

ubuntu/newbuntu/boot/Image: kernel/$(MV1000_KERNEL)/boot/Image ubuntu/newbuntu
	cp $< $@

ubuntu/newbuntu/lib/modules: kernel/$(MV1000_KERNEL)/modules ubuntu/newbuntu
	rm -rf $@ || true
	cp -a $< $@

ubuntu/newbuntu.tar.gz: ubuntu/newbuntu ubuntu/newbuntu/boot/Image ubuntu/newbuntu/lib/modules
	make -C $(@D) $(@F)

ubuntu/newbuntu.qcow2: ubuntu/newbuntu.tar.gz
	make -C $(@D) newbuntu.qcow2
