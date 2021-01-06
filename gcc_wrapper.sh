#!/bin/bash

# This keys on the fact that bazel does links by sending an argument with
# an @file as the first arg. This contains the params. When we see that, we
# just slide a -lstdc++ after.
# I only use this in a docker container and don't care about messing things up.
echo "INVOKE GCC: $@" 1>&2
arg="$1"
larg=""
if [[ "${arg:0:1}" == '@' ]]; then
  echo "PARAM FILE: $(cat "${arg:1}")" 1>&2
  larg="-lstdc++"
fi
echo "LARG=$larg" 1>&2

gcc_path="$(cd $(dirname $0) && pwd)/$(basename $0).real"
exec $gcc_path "$@" $larg
