# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Install and build ecowitt2mqtt:
RUN apk add --no-cache \
        python3 \
    && apk add --no-cache --virtual build-dependencies \
        build-base \
        python3-dev \
        libc-dev \
        musl-dev \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools wheel \
    && pip3 install --no-cache ecowitt2mqtt==2022.07.3 \
    && apk del build-dependencies

# Copy root filesystem
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
