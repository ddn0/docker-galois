FROM ubuntu:trusty
RUN apt-get update \
  && apt-get install -y cmake gcc-4.8 g++-4.8 patch libboost-dev \
  && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20 \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
ADD Galois-2.2.1.tar.gz /root
COPY docker.patch /root/
RUN cd /root && patch -p0 < docker.patch
RUN mkdir /root/build
WORKDIR /root
