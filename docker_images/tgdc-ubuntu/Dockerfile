FROM ubuntu:22.04

COPY gwinitd.c /tmp/gwinitd.c

RUN apt-get update -y && \
    apt-get install -y build-essential cmake curl wget autoconf make;

RUN cd /tmp && \
    gcc -s -Os -o /usr/local/bin/gwinitd gwinitd.c && \
    chmod +x /usr/local/bin/gwinitd && \
    rm -f /tmp/gwinitd.c;

CMD ["/usr/local/bin/gwinitd"]
