with import <nixpkgs> { };

mkShell {
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
    wxwidgets_3_2
    libx11
  ];

  shellHook = ''
    export KERL_CONFIGURE_OPTIONS="--with-ssl=${
      lib.getOutput "out" openssl
    } --without-javac --without-odbc";
  '';
}
