# Using upstream poppler 0.47.0
export PKG_CONFIG="/c/msys2-x64/mingw64/bin/pkg-config"
export PKG_CONFIG_PATH="/c/msys2-x64/mingw64/lib/pkgconfig"
export CPPFLAGS="-I/c/msys2-x64/mingw64/include"
export LIBJPEG_CFLAGS="-I/c/msys2-x64/mingw64/include"
export LIBOPENJPEG_CFLAGS="-DOPJ_STATIC -I/c/msys2-x64/mingw64/include/openjpeg-1.5"
export CFLAGS="-m64 -O3 -DNDEBUG -DOPJ_STATIC -DNO_vsnprintf"
export CXXLAGS="-m64 -O3 -DNDEBUG -DOPJ_STATIC -DNO_vsnprintf -Dpoppler_cpp_EXPORTS"
export LIBS="-L/c/msys2-x64/mingw64/lib"
export USER_LDFLAGS="-L/c/msys2-x64/mingw64/lib"
../poppler-0.47.0/configure \
	--disable-shared \
	--enable-static \
	--enable-libjpeg \
	--enable-libopenjpeg=auto \
	--enable-libpng \
	--enable-cms=auto \
	--enable-cairo-output \
	--enable-build-type=release \
	--with-font-configuration=win32 \
	--disable-relocatable \
	--disable-gtk-doc-html \
	--disable-nss \
	--disable-xpdf-headers \
	--disable-poppler-glib \
	--enable-introspection=no \
	--disable-poppler-qt4 \
	--disable-poppler-qt5 \
	--enable-splash-output \
	--disable-utils
