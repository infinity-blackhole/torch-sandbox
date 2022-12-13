{ pkgs, lib, stdenv }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nixpkgs-fmt
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.python39Packages.poetry
  ];
  shellHook = ''
    export LD_LIBRARY_PATH="${
      lib.makeLibraryPath [
        stdenv.cc.cc.lib
        pkgs.cudaPackages.cudnn
        pkgs.cudaPackages.cudatoolkit.lib
      ]
    }''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH"
  '';
}