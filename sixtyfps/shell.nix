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
    alias patchelf='patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" --set-rpath "${
      lib.makeLibraryPath buildInputs
    }"'
  '';
}
