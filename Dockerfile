FROM ubuntu@sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac

RUN apt-get update && apt-get install -y curl xz-utils build-essential gcc
RUN curl -L -o wavpack.tar.xz https://github.com/dbry/WavPack/releases/download/5.4.0/wavpack-5.4.0.tar.xz
RUN mkdir wavpack
WORKDIR wavpack
RUN tar --strip-components=1 -xvf ../wavpack.tar.xz
RUN ./configure --enable-asm --enable-man --enable-rpath --enable-dsd --enable-legacy --enable-apps
RUN make install
