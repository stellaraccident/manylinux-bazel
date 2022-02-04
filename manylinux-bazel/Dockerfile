FROM quay.io/pypa/manylinux2014_x86_64
MAINTAINER  Stella Laurenzo <stellaraccident@gmail.com>

USER root

RUN yum install -y java-11-openjdk-devel
COPY ./bazel /usr/local/bin/

# CUDA
RUN yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo
RUN yum install -y cuda-nvcc-11-6 cuda-cudart-devel-11-6 cuda-cupti-11-6

# See: https://github.com/bazelbuild/bazel/issues/10327
# Note also that many things that link fine on newer OS's seem to fail based
# on missing -lm, so just adding here.
ENV BAZEL_LINKOPTS ""
ENV BAZEL_LINKLIBS "-lstdc++ -lm"
