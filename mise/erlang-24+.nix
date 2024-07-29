with import <nixpkgs> { };

mkShell {
  buildInputs = [
    pkg-config
    gnumake
    autoconf
    automake
    ncurses
    openssl
    libxslt
    fop
    libxml2
    libGL
    libGLU
    (wxGTK32.override { withWebKit = true; })
    xorg.libX11
  ];

  shellHook = ''
    export KERL_CONFIGURE_OPTIONS="--with-ssl=${lib.getOutput "out" openssl} --with-ssl-incl=${lib.getDev openssl} --without-javac --without-odbc";
    export KERL_BUILD_DOCS=yes;
  '';
}
