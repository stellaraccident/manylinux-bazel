FROM quay.io/pypa/manylinux2014_x86_64
MAINTAINER  Stella Laurenzo <stellaraccident@gmail.com>

USER root

RUN yum install -y java-11-openjdk-devel
COPY ./bazel /usr/local/bin/

# See: https://github.com/bazelbuild/bazel/issues/10327
ENV BAZEL_LINKOPTS ""
ENV BAZEL_LINKLIBS "-lstdc++"
