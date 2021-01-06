FROM quay.io/pypa/manylinux2014_x86_64
MAINTAINER  Stella Laurenzo <stellaraccident@gmail.com>

USER root

RUN yum install -y java-11-openjdk-headless
COPY ./src/output/bazel /usr/local/bin
