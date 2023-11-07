# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

ARG ECOWITT2MQTT_VERSION=2023.11.1

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install and build ecowitt2mqtt:
RUN apk add --no-cache \
        python3 \
    && apk add --no-cache --virtual build-dependencies \
        build-base \
        python3-dev \
        libc-dev \
        musl-dev \
    && python3 -m ensurepip \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && pip3 install --no-cache-dir --upgrade pip setuptools wheel \
    && pip3 install --no-cache-dir ecowitt2mqtt==${ECOWITT2MQTT_VERSION} \
    && apk del build-dependencies

# Ensure Rust is in the path:
ENV PATH="/root/.cargo/bin:${PATH}"

# Copy root filesystem
COPY rootfs /
