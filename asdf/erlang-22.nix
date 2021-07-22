with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "asdf-erlang22-build-environment";

  buildInputs = [
    pkg-config
    gnumake
    autoconf269
    ncurses
    openssl
    libxslt
    fop
    libxml2
    libGL
    libGLU
    wxGTK30
    xorg.libX11
  ];

  KERL_CONFIGURE_OPTIONS =
    "--with-ssl=${lib.getOutput "out" openssl} --without-javac --without-odbc";
}
