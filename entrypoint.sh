#!/bin/bash

set -e;

cd /var/www/tgdc-bot/;

apt-get update -y;
apt-get install -y build-essential cmake curl wget autoconf make gperf libssl-dev zlib zlib1g-dev;

mkdir -pv build;
cd build;
cmake -DCMAKE_BUILD_TYPE=Release ../modules/td;
cmake --build .;

cd /;
exec /usr/local/bin/gwinitd;
