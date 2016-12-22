#!/bin/bash
set -e

# how to extract source, apply patch, configure and build static bin

NBD_VERSION="2.9.25"
if [ -d nbd-$NBD_VERSION ] ; then
        rm -fr nbd-$NBD_VERSION
fi
(tar zxf nbd-$NBD_VERSION.tar.gz && cd nbd-$NBD_VERSION && patch -p1 < ../patches/nbd-$NBD_VERSION.patch && \
./configure CFLAGS="-O0 -g" && make LDADD="-ldl -lz -static")

