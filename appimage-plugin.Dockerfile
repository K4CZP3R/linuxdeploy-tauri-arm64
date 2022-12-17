FROM ghcr.io/k4czp3r/linuxdeploy-tauri-arm64:base


COPY ./linuxdeploy-plugin-appimage /build/linuxdeploy-plugin-appimage

WORKDIR /build/linuxdeploy-plugin-appimage

RUN mkdir build
RUN cmake -S . -B build/
RUN make -C build install

WORKDIR /executables

RUN mv /usr/local/bin/linuxdeploy-plugin-appimage .

# check if it works
RUN /executables/linuxdeploy-plugin-appimage --plugin-type