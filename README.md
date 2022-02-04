# Bazel for manylinux2014

Bazel does not officially support manylinux2014, and the canned binaries are
incompatible with it. It also turns out that it has been historically hard
to build because of [this bug](https://github.com/bazelbuild/bazel/issues/10327).
Allegedly a fix is coming, but I couldn't even figure out how to tunnel the
flag through in the right way through the convoluted layers of build scripts.
I wasted enough time on this that I am just memorializing the build. Maybe it
won't be necessary some day.

## Building

Note that at least as of bazel-4.2.1, we don't need to build a custom version
anymore (seemingly). This section is kept for posterity.

Do this in a docker container. The patching will mess up your system.

```shell
# Fetch repo and cd into it.
docker run --rm -it -v $(pwd):/work quay.io/pypa/manylinux2014_x86_64 /bin/bash
```

```shell
cd /work
bash ./setup_dev_env_2014.sh
bash ./fetch_sources.sh
bash ./patch_gcc.sh
export PATH=/opt/python/cp38-cp38/bin:$PATH
bash ./build.sh
```

## Creating docker image

```shell
cp src/output/bazel manylinux-bazel/
docker build -t stellaraccident/manylinux2014_x86_64-bazel-4.2.2:latest manylinux-bazel/
docker push stellaraccident/manylinux2014_x86_64-bazel-4.2.2:latest
```

## Test image

```shell
docker run --rm -it -v $(pwd):/work stellaraccident/manylinux2014_x86_64-bazel-4.2.2:latest /bin/bash
bazel  # Verify that help comes up and does not complain.
```
