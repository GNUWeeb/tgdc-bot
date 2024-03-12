#!/bin/bash

apt update -y;
apt install -y build-essential cmake curl wget autoconf make;
exec /usr/local/bin/gwinitd;
