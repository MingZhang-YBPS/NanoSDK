FROM fedora:41
RUN yum makecache && yum install -y cmake perl openssl-devel ninja-build
RUN mkdir -p /src
COPY . /src
WORKDIR /src/build
RUN cmake -G Ninja -DBUILD_SHARED_LIBS=OFF -DNNG_ENABLE_QUIC=ON -DBUILD_DEMO=ON .. 
RUN ninja