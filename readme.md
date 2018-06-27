# Poppler 0.61.0

Applied patch [fixes.patch](fixes.patch) that does this:

 - fix static linking with cmake: [patch](https://lists.freedesktop.org/archives/poppler/2017-November/012652.html)
 - replace `"w"` with `"wb"` in poppler-image.cpp: [patch](https://bugs.freedesktop.org/show_bug.cgi?id=102494)

We need to build with `-Dpoppler_cpp_EXPORTS -DOPJ_STATIC` for static linking. If you get libopenjpeg linking errors, you probably need to rebuild libopenjpeg with rtools, or just copy the version from rwinlib into msys2.

## Build Script

See also [build.sh](build.sh)

```
curl -OL https://poppler.freedesktop.org/poppler-0.61.0.tar.xz
rm -Rf poppler-0.61.0
tar -xf poppler-0.61.0.tar.xz
cd  poppler-0.61.0

patch -p1 -i ../fixes.patch

export CPPFLAGS="-DOPJ_STATIC -Dpoppler_cpp_EXPORTS -I${MINGW_PREFIX}/include/openjpeg-2.2"
export CFLAGS=$CPPFLAGS
export CXXFLAGS=$CPPFLAGS

cmake . -G"MSYS Makefiles" \
	-DLIBOPENJPEG2_LIBRARIES="${MINGW_PREFIX}/lib/libopenjp2.a" \
	-DLIBOPENJPEG2_INCLUDE_DIR="${MINGW_PREFIX}/include/openjpeg-2.2" \
	-DCMAKE_INSTALL_PREFIX="${MINGW_PREFIX}" \
	-DCMAKE_BUILD_TYPE=RELEASE -DENABLE_UTILS=OFF \
	-DBUILD_CPP_TESTS=OFF -DBUILD_GTK_TESTS=OFF \
	-DENABLE_QT5=OFF -DENABLE_QT4=OFF -DENABLE_LIBCURL=OFF \
	-DENABLE_GLIB=OFF -DENABLE_XPDF_HEADERS=ON \
	-DBUILD_TESTS=OFF \
    -DBUILD_SHARED_LIBS=OFF

make -j8

```
