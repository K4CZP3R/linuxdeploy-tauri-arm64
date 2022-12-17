FROM ghcr.io/k4czp3r/linuxdeploy-tauri-arm64:linuxdeploy

WORKDIR /executables
RUN wget -q -4 -N https://raw.githubusercontent.com/tauri-apps/linuxdeploy-plugin-gtk/master/linuxdeploy-plugin-gtk.sh
RUN chmod +x linuxdeploy-plugin-gtk.sh

RUN apt-get update
RUN apt-get install -y fuse

RUN wget -q -4 -N https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-aarch64.AppImage

RUN chmod +x appimagetool-aarch64.AppImage

RUN ./appimagetool-aarch64.AppImage --appimage-extract

# Add /executables/squashfs-root/usr/bin to PATH
ENV PATH="/executables/squashfs-root/usr/bin:${PATH}"