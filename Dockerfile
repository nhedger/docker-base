FROM debian:bullseye-slim

ARG S6_OVERLAY_ARCH="x86_64"
ARG S6_OVERLAY_VERSION="3.1.2.1"

RUN apt-get update \
 && apt-get install -y xz-utils

# Install S6 overlay
# https://github.com/just-containers/s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCH}.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-${S6_OVERLAY_ARCH}.tar.xz

RUN mkdir -p /etc/s6-overlay/s6-rc.d/

# Pass argument to container that build from this base image
ARG DEBIAN_FRONTEND="noninteractive"

# Set default environment variables
ENV TZ="Europe/Zurich" \
    HOME="/root" \
    TERM="xterm-256color" \
    LANG="es_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

ENTRYPOINT [ "/init" ]
