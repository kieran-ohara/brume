# Prerequisites
KERNEL:=mv1000-ubuntu-kernel-master
KERNEL_ARM64=$(KERNEL).unzip/arch/arm64

# Only supports GL-iNet ubuntu for now.
ubuntu/ubuntu-18.04.3-20200109:
	make -C $(@D) $(@F)
kernel/$(KERNEL_ARM64)/boot/Image kernel/$(KERNEL_ARM64)/modules/lib/modules &:
	make -C kernel $(KERNEL_ARM64)/boot/Image

# Build task
BUILD_DIR=ubuntu/build

$(BUILD_DIR)/$(KERNEL): ubuntu/ubuntu-18.04.3-20200109
	rm -rf $@ || true
	mkdir -p $(@D)
	cp -a $< $@
$(BUILD_DIR)/$(KERNEL)/boot/Image: kernel/$(KERNEL_ARM64)/boot/Image
	mkdir -p $(@D)
	cp -a $< $@
$(BUILD_DIR)/$(KERNEL)/lib/modules: kernel/$(KERNEL_ARM64)/modules/lib/modules
	rm -rf $@
	mkdir -p $(@D)
	cp -a $< $@

$(BUILD_DIR)/$(KERNEL).tar.gz: $(BUILD_DIR)/$(KERNEL) $(BUILD_DIR)/$(KERNEL)/boot/Image $(BUILD_DIR)/$(KERNEL)/lib/modules
	cd $(BUILD_DIR)/$(KERNEL) && tar -czvf $(@F) *
	mv $(BUILD_DIR)/$(KERNEL)/$(KERNEL).tar.gz $@
	touch $@
$(BUILD_DIR)/$(KERNEL).qcow2: $(BUILD_DIR)/$(KERNEL).tar.gz
	docker run --rm -v $(CURDIR):/workspace -w /workspace \
		kieranbamforth/libguestfs:main virt-make-fs -F qcow2 $< $@
