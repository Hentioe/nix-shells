with import <nixpkgs> { };

mkShell rec {
  nativeBuildInputs = [ cmake pkg-config python3 ];

  buildInputs = [
    fontconfig
    xorg.libxcb
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    libGL
    freetype
    stdenv.cc.cc.lib
    qt5.full
  ];

  shellHook = ''
    export SIXTYFPS_STYLE=native
    alias patch-bin='patchelf --set-rpath "${lib.makeLibraryPath buildInputs}"'
  '';
}
