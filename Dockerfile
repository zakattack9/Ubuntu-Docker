FROM ubuntu:20.04

# update package repository and installed packages
RUN apt-get update -y && apt-get upgrade -y

# run dpkg without interactive dialog
ARG DEBIAN_FRONTEND=noninteractive

# install packages
RUN apt-get install -y \
    build-essential \
    gdb \
    manpages-dev \
    openssh-server \
    nano \
    grep \
    gzip \
    # networking packages
    nmap \
    iproute2 \
    iputils-tracepath \
    iputils-ping \
    net-tools \
    dnsutils \
    arping \
    curl \
    tcpdump \
