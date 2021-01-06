#!/bin/bash
set -e
cd $(dirname $0)

unset CC
unset CXX
unset LDFLAGS
export CC CXX LDFLAGS

export EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk --spawn_strategy=local"
cd src
bash ./compile.sh
