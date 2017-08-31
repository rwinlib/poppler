#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.1/bin/i386/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"

export LDFLAGS="-L/mingw32/lib"
export CPPFLAGS="-I/mingw32/include -DOPJ_STATIC"
export CXX="$CXX11 $CXX11STD $CPPFLAGS"
export CC="`$RCONFIG CC` $CPPFLAGS"

#export LIBJPEG_CFLAGS="-I/mingw32/include/openjpeg-2.2"
export LIBOPENJPEG_CFLAGS="-I/mingw32/include/openjpeg-2.1"
export LIBS="-L/mingw32/lib"
export USER_LDFLAGS="-L/mingw32/lib"
