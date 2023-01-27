{ pkgs, ... }:

{
  packages = [
    pkgs.cudaPackages.cudatoolkit
    pkgs.cudaPackages.cudnn
  ];
}
