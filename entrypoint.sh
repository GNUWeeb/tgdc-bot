#!/bin/bash

set -e;

cd /var/www/tgdc-bot/;

apt update -y;
apt install -y build-essential cmake curl wget autoconf make;

mkdir -pv build;
cd build;
cmake -DCMAKE_BUILD_TYPE=Release modules/td;
cmake --build .;

cd /;
exec /usr/local/bin/gwinitd;
