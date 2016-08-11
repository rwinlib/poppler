C++ interface to poppler. This build only depends on libiconv.
All the PDF rendering stuff is disabled.

In Makevars.win in the R package make sure to set:

    PKG_CXXFLAGS="-Dpoppler_cpp_EXPORTS"

See build.sh
