#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.1/bin/x64/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export LDFLAGS="-L/mingw64/lib"
export CPPFLAGS="-I/mingw64/include -DOPJ_STATIC"
export CXX="$CXX11 $CXX11STD $CPPFLAGS"
export CC="`$RCONFIG CC` $CPPFLAGS"

export LIBJPEG_CFLAGS="-I/mingw64/include"
export LIBS="-L/mingw64/lib"
export USER_LDFLAGS="-L/mingw64/lib"
