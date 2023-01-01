{ pkgs, lib, ... }:

with lib;

{
  pre-commit.hooks = {
    black.enable = true;
    isort.enable = true;
  };
  packages = [
    (pkgs.python39.withPackages (ps: with ps; [
      poetry
      pip
    ]))
  ] ++ optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs.cudaPackages.cudatoolkit
    pkgs.cudaPackages.cudnn
  ];
}
