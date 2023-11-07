# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_PREFER_BINARY=1 \

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
    && printf "[global]\nextra-index-url=https://www.piwheels.org/simple\n" > /etc/pip.conf \
    && pip3 install --no-cache-dir --upgrade pip setuptools wheel \
    && pip3 install --no-cache-dir ecowitt2mqtt==${ECOWITT2MQTT_VERSION} \
    && apk del build-dependencies

# Copy root filesystem
COPY rootfs /
