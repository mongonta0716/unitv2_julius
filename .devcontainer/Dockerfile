# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version: debian-10, debian-9, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="ubuntu-20.04"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    libgtk2.0-dev \
    pkg-config \
    libasound2-dev \
    && apt-get clean && rm -rf /var/lib/opt/lists/*

# Copy as needed for alsa-lib link
RUN cp /usr/arm-linux-gnueabihf/lib/libgcc_s.so.1 /usr/lib/

# Clone dependencies
WORKDIR /external 
RUN wget http://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.9.tar.bz2 \
    && mkdir alsalib \
    && tar -xvf alsa-lib-1.2.9.tar.bz2 --strip-components 1 -C alsalib \
    && rm alsa-lib-1.2.9.tar.bz2 \
    && wget https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.17.tar.gz \
    && mkdir libiconv \
    && tar -xvf libiconv-1.17.tar.gz --strip-components 1 -C libiconv \
    && rm libiconv-1.17.tar.gz \
    && mkdir julius \
    && wget https://github.com/julius-speech/julius/archive/refs/tags/v4.3.1.tar.gz \
    && tar xvf v4.3.1.tar.gz --strip-components 1 -C julius \
    && rm v4.3.1.tar.gz \
    && mkdir unitv2_root

## build alsa-lib 
WORKDIR /external/alsalib
RUN env NM=nm ./configure --host=arm-none-linux-gnueabihf CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ \
    && make && make install 

## Build iconv 

WORKDIR /external/libiconv
RUN CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ ./configure --prefix=/external/unitv2_root --host=arm-none-linux-gnueabihf \
    && make && make install 

# Build julius
WORKDIR /external/julius
RUN CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ ./configure --prefix /external/unitv2_root --host=arm-none-linux-gnueabihf --enable-charconv=iconv --with-mictype=alsa --enable-pthread \
    && make && make install

WORKDIR /external/unitv2_root
RUN tar cf /external/julius_files.tar bin include lib man
#COPY /external/julius_files.tar .

