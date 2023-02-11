ARG BUILD_FROM
FROM $BUILD_FROM as image

ARG EBUSD_ARCH=amd64
ARG S6_OVERLAY_VERSION=3.1.3.0

ENV EBUSD_VERSION 23.1
ENV EBUSD_IMAGE=bullseye


LABEL maintainer "ebusd@ebusd.eu"
LABEL version="${EBUSD_VERSION}-${EBUSD_ARCH}"

RUN apt-get update && apt-get install -y libmosquitto1 ca-certificates setserial

ADD https://github.com/john30/ebusd/releases/download/${EBUSD_VERSION}/ebusd-${EBUSD_VERSION}_${EBUSD_ARCH}-${EBUSD_IMAGE}_mqtt1.deb ebusd.deb

RUN dpkg -i ebusd.deb \
    && rm -f ebusd.deb \
	&& update-ca-certificates

COPY rootfs /
