#!/bin/bash

set -e;

cd /var/www/tgdc-bot/;

apt-get update -y;
apt-get install -y sudo build-essential cmake curl wget autoconf make gperf libssl-dev zlib1g-dev;

wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh;
bash /tmp/llvm.sh 18;

mkdir -pv build/tmp/tdlib;
mkdir -pv build/lib/tdlib;

cd build/tmp/tdlib;
export CC=clang-18;
export CXX=clang++-18;

cmake -DCMAKE_BUILD_TYPE=Release ../../../modules/td -D -DCMAKE_INSTALL_PREFIX:PATH=../../tdlib;
cmake --build . --target install -j$(nproc);

cd /;
exec /usr/local/bin/gwinitd;
