FROM ubuntu:22.04 as base

WORKDIR /code

ARG ARG_TIMEZONE=America/Los_Angeles
ENV CONTAINER_TIMEZONE=${ARG_TIMEZONE}
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone:
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt-get -y update && apt-get upgrade \
    && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential \
    cmake \
    g++ \
    asciidoctor \
    qtbase5-dev \
    qtbase5-private-dev \
    qttools5-dev \
    qttools5-dev-tools \
    libqt5svg5-dev \
    libargon2-dev \
    libminizip-dev \
    libbotan-2-dev \
    libqrencode-dev \
    zlib1g-dev asciidoctor \
    libreadline-dev \
    libpcsclite-dev \
    libusb-1.0-0-dev \
    libxi-dev \
    libxtst-dev  \
    libqt5x11extras5-dev

COPY ./keepassxc /code
COPY ./docker-entrypoint.sh /code/docker-entrypoint.sh

VOLUME [ "/code/build" ]

ENTRYPOINT [ "/code/docker-entrypoint.sh" ]
