FROM ubuntu@sha256:626ffe58f6e7566e00254b638eb7e0f3b11d4da9675088f4781a50ae288f3322

RUN apt-get update && apt-get install -y curl xz-utils build-essential gcc
RUN curl -L -o wavpack.tar.xz https://github.com/dbry/WavPack/releases/download/5.4.0/wavpack-5.4.0.tar.xz
RUN mkdir wavpack
WORKDIR wavpack
RUN tar --strip-components=1 -xvf ../wavpack.tar.xz
RUN ./configure --enable-asm --enable-man --enable-rpath --enable-dsd --enable-legacy --enable-apps
RUN make install
