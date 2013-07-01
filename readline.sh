#!/bin/bash

# Cycript - Optimizing JavaScript Compiler/Runtime
# Copyright (C) 2009-2013  Jay Freeman (saurik)

# GNU General Public License, Version 3 {{{
#
# Cycript is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
#
# Cycript is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Cycript.  If not, see <http://www.gnu.org/licenses/>.
# }}}

set -e

version=$1
# XXX: verify version

readline=readline-${version}
arch="-arch i386 -arch x86_64"

rm -f "${readline}".tar.gz
rm -rf "${readline}"

curl -O ftp://ftp.cwru.edu/pub/bash/"${readline}".tar.gz
tar -zxf "${readline}".tar.gz

cd "${readline}"

CFLAGS="-g -O2 ${arch}" ./configure --disable-shared --enable-static
make
ln -s . readline