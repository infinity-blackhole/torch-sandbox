{
  description = "Torch Sandbox";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    devenv.url = "github:cachix/devenv";
  };

  outputs = { nixpkgs, devenv, ... }@inputs: {
    devShells = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.unix (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        default = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [
            ./modules/base.nix
            ./modules/python.nix
          ];
        };
        cuda = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [
            ./modules/base.nix
            ./modules/python.nix
            ./modules/cuda.nix
          ];
        };
      }
    );
  };
}
