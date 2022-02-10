FROM ubuntu@sha256:669e010b58baf5beb2836b253c1fd5768333f0d1dbcb834f7c07a4dc93f474be

RUN apt-get update && apt-get install -y curl xz-utils build-essential gcc
RUN curl -L -o wavpack.tar.xz https://github.com/dbry/WavPack/releases/download/5.4.0/wavpack-5.4.0.tar.xz
RUN mkdir wavpack
WORKDIR wavpack
RUN tar --strip-components=1 -xvf ../wavpack.tar.xz
RUN ./configure --enable-asm --enable-man --enable-rpath --enable-dsd --enable-legacy --enable-apps
RUN make install
