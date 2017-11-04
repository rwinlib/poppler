# Poppler 0.61.0

Applied 2 patches:

 - fix static linking with cmake: [patch](https://lists.freedesktop.org/archives/poppler/2017-November/012652.html)
 - replace `"w"` with `"wb"` in poppler-image.cpp: [patch](https://bugs.freedesktop.org/show_bug.cgi?id=102494)

We need to build with `-Dpoppler_cpp_EXPORTS -DOPJ_STATIC` for static linking. If you get libopenjpeg linking errors, you probably need to rebuild libopenjpeg with rtools, or just copy the version from rwinlib into msys2.

## Build Script

```
#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.2/bin/x64/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export LDFLAGS="-L/mingw64/lib"
export CPPFLAGS="-I/mingw64/include -DOPJ_STATIC"
export CXX="$CXX11 $CXX11STD"
export CXXFLAGS="-Dpoppler_cpp_EXPORTS -DOPJ_STATIC"
export CC="`$RCONFIG CC`"
export CFLAGS="-Dpoppler_cpp_EXPORTS -DOPJ_STATIC"

export LIBJPEG_CFLAGS="-I/mingw64/include"
export LIBS="-L/mingw64/lib"
export USER_LDFLAGS="-L/mingw64/lib"
```

Poppler has switched to cmake (e.g. `mingw-w64-x86_64-cmake`) now:

```
cmake . -G"MSYS Makefiles" \
	-DCMAKE_INSTALL_PREFIX="/usr/local" \
	-DCMAKE_BUILD_TYPE=RELEASE -DENABLE_UTILS=OFF \
	-DBUILD_CPP_TESTS=OFF -DBUILD_GTK_TESTS=OFF \
	-DENABLE_QT5=OFF -DENABLE_QT4=OFF -DENABLE_LIBCURL=OFF \
	-DENABLE_GLIB=OFF -DENABLE_XPDF_HEADERS=ON

make -j8
make install
```
