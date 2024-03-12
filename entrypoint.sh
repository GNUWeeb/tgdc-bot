#!/bin/bash

set -e;

export CC=clang-18;
export CXX=clang++-18;

cd /var/www/tgdc-bot/;
mkdir -pv build/tmp/td;
mkdir -pv build/lib/td;
mkdir -pv build/tmp/tgbot-api;

cd build/tmp/td;
cmake -DCMAKE_BUILD_TYPE=Release ../../../modules/td -DCMAKE_INSTALL_PREFIX:PATH=../../lib/td;
cmake --build . --target install -j$(nproc);
cd ../../..;

cd build/tmp/tgbot-api;
cmake -DCMAKE_BUILD_TYPE=Release ../../../modules/telegram-bot-api;
cmake --build . --target install -j$(nproc);

cd /;
exec /usr/local/bin/gwinitd;
