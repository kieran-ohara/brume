ubuntu-18.04.3-20200109.tar.gz:
	curl -SL http://download.gl-inet.com/firmware/mv1000/ubuntu/testing/ubuntu-18.04.3-20200109.tar.gz -o $@

ubuntu-18.04.3-20200109: ubuntu-18.04.3-20200109.tar.gz
	mkdir $@
	tar -zxf $< --directory $@

Dockerfile.tar: Dockerfile
	docker build -t virt-make-fs .
	touch $@

env-file.txt:
	touch $@

%.tar.gz:
	cd $* && tar -czvf $@ *
	mv $*/$@ $@

%.qcow2: %.tar.gz Dockerfile.tar env-file.txt
	docker run --rm -v $(CURDIR):/workspace -w /workspace \
		--env-file env-file.txt \
		virt-make-fs -F qcow2 $< $@
