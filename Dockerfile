FROM registry.cn-hangzhou.aliyuncs.com/shanchain/jenkins-slave-dind:latest
MAINTAINER snow "xuefeng.zhao@shanchain.com"
RUN apt-get update && \
	apt-get install -y git
RUN cd lib && \
	git clone git://github.com/payden/libwebsock.git && \
	apt-get install -y build-essential libtool automake libevent-dev libssl-dev
RUN cd lib/libwebsock && \
	./autogen.sh && \
	./configure && make && sudo make install
