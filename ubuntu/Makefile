ubuntu-18.04.3-20200109.tar.gz:
	curl -SL http://download.gl-inet.com/firmware/mv1000/ubuntu/testing/ubuntu-18.04.3-20200109.tar.gz -o $@

ubuntu-18.04.3-20200109: ubuntu-18.04.3-20200109.tar.gz
	mkdir $@
	tar -zxf $< --directory $@
