#!/bin/bash

gcc="$(which gcc)"
if [ -f "$gcc.real" ]; then
  echo "$gcc already seems patched"
  exit 1
fi

cp $gcc $gcc.real
cp -f "$(dirname $0)/gcc_wrapper.sh" $gcc
chmod a+x $gcc
