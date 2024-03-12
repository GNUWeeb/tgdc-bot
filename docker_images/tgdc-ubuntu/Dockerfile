FROM ubuntu:22.04

COPY gwinitd.c /tmp/gwinitd.c

RUN apt-get update -y \
    && apt-get install -y sudo build-essential cmake curl wget autoconf make \
       gperf libssl-dev zlib1g-dev lsb-release wget software-properties-common \
       gnupg;

RUN wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh \
    && bash /tmp/llvm.sh 18 \
    && rm -f /tmp/llvm.sh \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-18 400 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 400;

RUN cd /tmp \
    && gcc -s -Os -o /usr/local/bin/gwinitd gwinitd.c \
    && chmod +x /usr/local/bin/gwinitd \
    && rm -f /tmp/gwinitd.c;

CMD ["/usr/local/bin/gwinitd"]
