{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib, stdenv ? pkgs.stdenv }:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python39.withPackages (pypkgs: with pypkgs; [ pip poetry ]))
    pkgs.bashInteractive
  ];
  shellHook = ''
    poetry shell
  '';
  LD_LIBRARY_PATH = lib.concatStringsSep ":" [
    "/usr/lib/wsl/lib"
    "/run/opengl-drivers/lib"
    "/run/opengl-drivers-32/lib"
    (lib.makeLibraryPath [ stdenv.cc.cc.lib ])
  ];
}
