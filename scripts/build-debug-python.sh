#!/bin/bash -eux

VERSION=3.6.5
MAJOR_VERSION=$(echo $VERSION | cut -d. -f1-2)
PREFIX=~/python-$MAJOR_VERSION-debug
if [[ -f $PREFIX/bin/python3 ]]; then
    exit
fi

wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
tar zxf Python-$VERSION.tgz
pushd Python-$VERSION
./configure CFLAGS='-DPy_DEBUG -DPy_TRACE_REFS -DPYMALLOC_DEBUG' --with-pydebug --prefix=$PREFIX
make -j4
make install
$PREFIX/bin/pip3 install virtualenv
$PREFIX/bin/virtualenv ~/virtualenv/python-$MAJOR_VERSION-debug/
ln -s python3-config $PREFIX/bin/python-config
