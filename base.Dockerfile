FROM debian:sid as build-stage

# Update
RUN apt-get update

# Install dependencies
RUN apt-get install -y \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    libwebkit2gtk-4.0-dev \
    cmake \ 
    build-essential \
    git \
    patchelf \
    ccache \
    pkg-config \
    libpng-dev \
    libjpeg-dev