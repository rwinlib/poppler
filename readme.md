# Poppler 0.72.1

This is a build of poppler 0.72.0 with some patches:

 - Backport two patches from poppler 0.73.0 to fix UTF-8
 - Patch to make it work with GCC 4.9.3 which had some conflict with `timegm`

For more details see [PKGBUILD](mingw-w64-poppler/PKGBUILD).
 
We need to build with `-Dpoppler_cpp_EXPORTS -DOPJ_STATIC` for static linking. If you get libopenjpeg linking errors, you probably need to rebuild libopenjpeg with rtools, or just copy the version from rwinlib into msys2.
