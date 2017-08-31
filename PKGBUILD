# Maintainer: Alexey Pavlov <alexpux@gmail.com>

_realname=poppler
pkgbase=mingw-w64-${_realname}
pkgname="${MINGW_PACKAGE_PREFIX}-${_realname}"
pkgver=0.57.0
pkgrel=1
pkgdesc="PDF rendering library based on xpdf 3.0 (mingw-w64)"
arch=('any')
url="https://poppler.freedesktop.org/"
license=("GPL")
makedepends=("${MINGW_PACKAGE_PREFIX}-gcc"
             "${MINGW_PACKAGE_PREFIX}-pkg-config"
             "${MINGW_PACKAGE_PREFIX}-glib2"
             "${MINGW_PACKAGE_PREFIX}-gobject-introspection")
depends=("${MINGW_PACKAGE_PREFIX}-cairo"
         "${MINGW_PACKAGE_PREFIX}-curl"
         "${MINGW_PACKAGE_PREFIX}-freetype"
         "${MINGW_PACKAGE_PREFIX}-icu"
         "${MINGW_PACKAGE_PREFIX}-libjpeg"
         "${MINGW_PACKAGE_PREFIX}-libpng"
         "${MINGW_PACKAGE_PREFIX}-libtiff"
         "${MINGW_PACKAGE_PREFIX}-nss"
         "${MINGW_PACKAGE_PREFIX}-openjpeg2"
         "${MINGW_PACKAGE_PREFIX}-poppler-data"
         "${MINGW_PACKAGE_PREFIX}-zlib")
optdepends=("${MINGW_PACKAGE_PREFIX}-glib2: libpoppler-glib"
            "${MINGW_PACKAGE_PREFIX}-qt5: libpoppler-qt5")
options=('strip' 'staticlibs')
source=("https://poppler.freedesktop.org/${_realname}-${pkgver}.tar.xz")
sha256sums=('537f2bc60d796525705ad9ca8e46899dcc99c2e9480b80051808bae265cdc658')

prepare() {
  cd "${srcdir}/${_realname}-${pkgver}"
  #sed -i -e '/AC_PATH_XTRA/d' configure.ac
  #sed -i "s:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:" configure.ac
  autoreconf -fi
}

build() {
  mkdir -p "${srcdir}/build-${MINGW_CHOST}"
  cd "${srcdir}/build-${MINGW_CHOST}"
  ../${_realname}-${pkgver}/configure \
    --prefix=${MINGW_PREFIX} \
    --build=${MINGW_CHOST} \
    --host=${MINGW_CHOST} \
    --enable-static \
    --disable-shared \
    --enable-libopenjpeg=auto \
    --enable-cms=auto \
    --enable-cairo-output \
    --disable-relocatable \
    --disable-libnss \
    --disable-libcurl \
    --disable-poppler-glib \
    --disable-introspection \
    --disable-poppler-qt4 \
    --disable-poppler-qt5 \
    --enable-splash-output \
    --disable-xpdf-headers \
    --enable-zlib \
    --disable-gtk-test \
    --disable-utils \
    --disable-gtk-doc-html \
    --with-font-configuration=win32

  make
}

package() {
  cd "${srcdir}/build-${MINGW_CHOST}"
  make DESTDIR="${pkgdir}" install
}
