# Using upstream poppler 0.46.0
export PKG_CONFIG="/c/msys2-i686/mingw32/bin/pkg-config"
export PKG_CONFIG_PATH="/c/msys2-i686/mingw32/lib/pkgconfig"
export CFLAGS="-m32"
export CXXLAGS="-m32 -Dpoppler_cpp_EXPORTS"
../poppler-0.46.0/configure \
     --enable-shared \
     --enable-static \
     --disable-libjpeg \
     --disable-libopenjpeg \
     --disable-libpng \
     --disable-cms \
     --disable-cairo-output \
     --disable-poppler-glib \
     --disable-splash-output \
     --disable-utils
