FROM ubuntu:xenial

LABEL maintainer "Mitsutaka Takada <mtakada@nces.i.nagoya-u.ac.jp>"
LABEL description="core Flight System(cFS) development environment (Ubuntu:xenial)"

ENV PACKAGES \
    git python-pip python-qt4 cmake
RUN apt-get update \
    && apt-get -y install $PACKAGES \
    && pip install pyzmq \
    && dpkg -l $PACKAGES | sort > /packages.txt
 