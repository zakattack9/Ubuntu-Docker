FROM ubuntu:20.04

# update package repository and installed packages
RUN apt-get update -y && apt-get upgrade -y

# run dpkg without interactive dialog
ARG DEBIAN_FRONTEND=noninteractive

# install packages
RUN apt-get install -y \
    # man packages
    man-db \
    manpages-dev \
    most \
    # dev packages
    build-essential \
    gdb \
    openssh-server \
    nano \
    vim \
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
    tcpdump 

# unminimize linux system to allow for use of man
# running this increases image size...
RUN yes | unminimize

# set pager to use most (useful for man pages)
ENV PAGER=most
