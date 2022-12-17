FROM ghcr.io/k4czp3r/linuxdeploy-tauri-arm64:appimage-plugin AS build-stage

COPY ./linuxdeploy /build/linuxdeploy

WORKDIR /build/linuxdeploy

RUN mkdir build

RUN cmake -S . -B build/

# Using bash command, replace "copyright.h" with "copyright/copyright.h" in /build/linuxdeploy/src/core/appdir.cpp
RUN sed -i 's/copyright.h/copyright\/copyright.h/g' /build/linuxdeploy/src/core/appdir.cpp

RUN make -C build install

WORKDIR /executables

RUN mv /usr/local/bin/linuxdeploy .