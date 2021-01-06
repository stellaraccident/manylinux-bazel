FROM quay.io/pypa/manylinux2014_x86_64
MAINTAINER  Stella Laurenzo <stellaraccident@gmail.com>

USER root

RUN yum install -y java-11-openjdk-devel
COPY ./bazel /usr/local/bin/
