FROM ubuntu@sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508

RUN apt-get update && apt-get install -y curl xz-utils build-essential gcc
RUN curl -L -o wavpack.tar.xz https://github.com/dbry/WavPack/releases/download/5.4.0/wavpack-5.4.0.tar.xz
RUN mkdir wavpack
WORKDIR wavpack
RUN tar --strip-components=1 -xvf ../wavpack.tar.xz
RUN ./configure --enable-asm --enable-man --enable-rpath --enable-dsd --enable-legacy --enable-apps
RUN make install
