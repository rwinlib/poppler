This contains the c++ interface to poppler. This build only depends on libiconv:

    CPPFLAGS="-I/usr/local/include" LDFLAGS="-L/local/lib" \
    CFLAGS="-m64" CXXFLAGS="-m64 -Dpoppler_cpp_EXPORTS" \
    ../poppler-0.41.0/configure --disable-shared --enable-static --disable-splash-output

In Makevars.win in the R package make sure to set:

    PKG_CXXFLAGS="-Dpoppler_cpp_EXPORTS"

Maybe I should enable libpng, libtiff, libjpeg as well, not sure what they are
used for.
