#!/bin/bash
set -e
version=3.7.2

cd $(dirname $0)
mkdir -p src src_orig

if ! [ -f "bazel-$version-dist.zip" ]; then
  wget https://github.com/bazelbuild/bazel/releases/download/$version/bazel-$version-dist.zip
fi

pushd src
if ! [ -f "WORKSPACE" ]; then
  unzip ../bazel-$version-dist.zip
  patch -p1 < ../patches/000-disable_include_problems.patch
fi
popd

pushd src_orig
if ! [ -f "WORKSPACE" ]; then
  unzip ../bazel-$version-dist.zip
fi
popd
