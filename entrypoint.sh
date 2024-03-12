#!/bin/bash

set -e;

cd /var/www/tgdc-bot/;
mkdir -pv build/tmp/td;
mkdir -pv build/lib/td;

cd build/tmp/td;
export CC=clang-18;
export CXX=clang++-18;

cmake -DCMAKE_BUILD_TYPE=Release ../../../modules/td -DCMAKE_INSTALL_PREFIX:PATH=../../lib/td;
cmake --build . --target install -j$(nproc);

cd /;
exec /usr/local/bin/gwinitd;
