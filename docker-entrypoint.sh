#!/bin/bash

mkdir -p build
# cd build
cmake -DWITH_XC_NETWORKING=OFF -DWITH_XC_SSHAGENT=ON -DWITH_APP_BUNDLE=OFF
make
